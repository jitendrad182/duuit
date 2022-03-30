import 'package:async/async.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/add_buddies_controller.dart';
import 'package:duuit/main.dart';
import 'package:duuit/services/db/db_1.dart';
import 'package:duuit/services/db/db_2.dart';
import 'package:duuit/services/db/db_3.dart';
import 'package:duuit/services/db/db_4.dart';
import 'package:duuit/views/dialogs/dialogs.dart';
import 'package:duuit/views/pages/home/home.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_1.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_2.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  final AsyncMemoizer _asyncMemoizer = AsyncMemoizer();

  bool isSignedIn = false;
  String userId = '';
  DateTime? lastSignInTime;
  int userInfo = 0;
  int userGoalInfo = 0;
  bool createProfileControllerIsInitialized = false;

  doThis() async {
    isSignedIn = true;
    userId = _auth.currentUser!.uid;
    lastSignInTime = _auth.currentUser!.metadata.lastSignInTime;
  }

  currentUser() async {
    return _asyncMemoizer.runOnce(
      () async {
        if (_auth.currentUser?.uid == null) {
          isSignedIn = false;
        } else {
          await doThis();
          await getUserInfo();
        }
        return _auth.currentUser;
      },
    );
  }

  getUserInfo() async {
    final dbController2 = Get.put(DbController2(), permanent: true);
    await dbController2.getMyInfo();
    userInfo = dbController2.length();
    if (userInfo >= 1) {
      await getUserGoalInfo();
    }
  }

  getUserGoalInfo() async {
    final dbController4 = Get.put(DbController4(), permanent: true);
    await dbController4.getMyGoalInfo();
    userGoalInfo = dbController4.length();
  }

  signOut() async {
    await _googleSignIn.signOut();
    await _facebookAuth.logOut();
    await _auth.signOut();

    isSignedIn = false;
    userId = '';
    lastSignInTime = null;
    userInfo = 0;
    userGoalInfo = 0;
    createProfileControllerIsInitialized = false;

    Get.offAll(() => const OnboardingPage1());
  }

  forgotPassword(String email, BuildContext context) async {
    Dialogs.circularProgressIndicatorDialog(context);
    await _auth.sendPasswordResetEmail(email: email).then(
      (value) {
        navigatorKey.currentState!.pop();
        Dialogs.defaultDialog1(
            StringConst.resetPassword, StringConst.passwordResetEmail);
      },
    ).catchError(
      (e) {
        navigatorKey.currentState!.pop();
        Dialogs.defaultErrorDialog1(e.message.toString());
      },
    );
  }

  createUser(String email, String password, BuildContext context) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await doThis();
        return await helperFunction1();
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultErrorDialog1(e.message.toString());
    }
  }

  signInWithEmail(String email, String password, BuildContext context) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await doThis();
        await getUserInfo();
        return helperFunction2();
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultErrorDialog1(e.message.toString());
    }
  }

  signInWithGoogle(bool isSignInPage, BuildContext context) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        return await helperFunction3(isSignInPage);
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultErrorDialog1(e.message.toString());
    }
  }

  signInWithFacebook(bool isSignInPage, BuildContext context) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      final LoginResult loginResult = await _facebookAuth.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      User? user = userCredential.user;
      if (user != null) {
        return await helperFunction3(isSignInPage);
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultErrorDialog1(e.message.toString());
    }
  }

  //TODO:
  helperFunction1() async {
    await DbController1().saveUserInfo().then((value) async {
      final DbController3 dbController3 = Get.find();
      await dbController3.saveUserGoalInfo().then((val) async {
        final DbController2 dbController2 =
            Get.put(DbController2(), permanent: true);
        final DbController4 dbController4 =
            Get.put(DbController4(), permanent: true);
        await dbController2.getMyInfo();
        await dbController4.getMyGoalInfo();
        final AddBuddiesController addBuddiesController = Get.find();
        await addBuddiesController.saveBuddies(dbController3.docId);
        userInfo = dbController2.length();
        userGoalInfo = dbController4.length();
        createProfileControllerIsInitialized = false;
        Get.offAll(() => HomePage());
      });
    });
  }
  //TODO:

  helperFunction2() {
    if (userInfo < 1) {
      Get.to(() => OnboardingPage2());
    } else {
      if (userGoalInfo > 0) {
        Get.offAll(() => HomePage());
      } else {
        Get.to(() => OnboardingPage3());
      }
    }
  }

  helperFunction3(bool isSignInPage) async {
    await doThis();
    if (isSignInPage) {
      await getUserInfo();
      return helperFunction2();
    } else {
      return await helperFunction1();
    }
  }
}
