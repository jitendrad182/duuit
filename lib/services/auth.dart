import 'package:duuit/bindings/home_binding.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/add_buddies_controller.dart';
import 'package:duuit/main.dart';
import 'package:duuit/services/db_1.dart';
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

//TODO:

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  bool? isSignedIn;
  User? user;
  String? userId;
  DateTime? creationTime;
  DateTime? lastSignInTime;
  String? authProviderId;

  int? userInfo;
  int? userGoalInfo;

  bool createProfileControllerIsInitialized = false;
  bool dbController2IsInitialized = false;

  currentUser() async {
    if (_auth.currentUser?.uid == null) {
      isSignedIn = false;
    } else {
      await doThis();
      await getUserInfo();
      await getUserGoalInfo();
    }
    return _auth.currentUser;
  }

  doThis() async {
    isSignedIn = true;
    user = _auth.currentUser;
    userId = _auth.currentUser?.uid;
    creationTime = _auth.currentUser!.metadata.creationTime;
    lastSignInTime = _auth.currentUser!.metadata.lastSignInTime;
    authProviderId = _auth.currentUser!.providerData[0].providerId;
  }

  getUserInfo() async {
    final dbController2 = Get.put(DbController2(), permanent: true);
    await dbController2.getMyInfo();
    userInfo = dbController2.userProfileModel.length;
  }

  getUserGoalInfo() async {
    final dbController4 = Get.put(DbController4(), permanent: true);
    await dbController4.getMyGoalInfo();
    userGoalInfo = dbController4.goalModel.length;
  }

  signOut() async {
    await _googleSignIn.signOut();
    await _facebookAuth.logOut();
    await _auth.signOut();
    Get.offAll(() => const OnboardingPage1());
  }

  createUser(
      {String? email, String? password, required BuildContext context}) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
      User? user = userCredential.user;
      if (user != null) {
        await doThis();
        await DbController1().saveUserInfo().then((value) async {
          await DbController3().saveUserGoalInfo().then((val) async {
            final DbController2 dbController2 = Get.put(DbController2());
            final DbController4 dbController4 = Get.put(DbController4());
            await dbController2.getMyInfo();
            await dbController4.getMyGoalInfo();
            Get.offAll(() => HomePage(), binding: HomeBinding());
            final AddBuddiesController addBuddiesController = Get.find();
            await addBuddiesController.saveBuddies(dbController4);
          });
        });
      } else {
        navigatorKey.currentState!.pop();
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: e.message.toString(),
      );
    } catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.anUnexpectedError,
      );
    }
  }

  signInWithEmail(
      {String? email, String? password, required BuildContext context}) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      User? user = userCredential.user;
      if (user != null) {
        await doThis();
        await getUserInfo();
        await getUserGoalInfo();
        if (userInfo! < 1) {
          Get.to(() => OnboardingPage2());
        } else {
          if (userGoalInfo! > 0) {
            Get.offAll(() => HomePage(), binding: HomeBinding());
          } else {
            Get.to(() => OnboardingPage3());
          }
        }
      } else {
        navigatorKey.currentState!.pop();
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: e.message.toString(),
      );
    } catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.anUnexpectedError,
      );
    }
  }

  signInWithGoogle(
      {required bool isSignInPage, required BuildContext context}) async {
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
        if (isSignInPage) {
          await doThis();
          await getUserInfo();
          await getUserGoalInfo();
          if (userInfo! < 1) {
            Get.to(() => OnboardingPage2());
          } else {
            if (userGoalInfo! > 0) {
              Get.offAll(() => HomePage(), binding: HomeBinding());
            } else {
              Get.to(() => OnboardingPage3());
            }
          }
        } else {
          await DbController1().saveUserInfo().then((value) async {
            await DbController3().saveUserGoalInfo().then((val) async {
              final DbController2 dbController2 = Get.put(DbController2());
              final DbController4 dbController4 = Get.put(DbController4());
              await dbController2.getMyInfo();
              await dbController4.getMyGoalInfo();
              Get.offAll(() => HomePage(), binding: HomeBinding());
              final AddBuddiesController addBuddiesController = Get.find();
              await addBuddiesController.saveBuddies(dbController4);
            });
          });
        }
      } else {
        navigatorKey.currentState!.pop();
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: e.message.toString(),
      );
    } catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.anUnexpectedError,
      );
    }
  }

  signInWithFacebook(
      {required bool isSignInPage, required BuildContext context}) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      final LoginResult loginResult = await _facebookAuth.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      User? user = userCredential.user;
      if (user != null) {
        if (isSignInPage) {
          await doThis();
          await getUserInfo();
          await getUserGoalInfo();
          if (userInfo! < 1) {
            Get.to(() => OnboardingPage2());
          } else {
            if (userGoalInfo! > 0) {
              Get.offAll(() => HomePage(), binding: HomeBinding());
            } else {
              Get.to(() => OnboardingPage3());
            }
          }
        } else {
          await DbController1().saveUserInfo().then((value) async {
            await DbController3().saveUserGoalInfo().then((val) async {
              final DbController2 dbController2 = Get.put(DbController2());
              final DbController4 dbController4 = Get.put(DbController4());
              await dbController2.getMyInfo();
              await dbController4.getMyGoalInfo();
              Get.offAll(HomePage(), binding: HomeBinding());
              final AddBuddiesController addBuddiesController = Get.find();
              await addBuddiesController.saveBuddies(dbController4);
            });
          });
        }
      } else {
        navigatorKey.currentState!.pop();
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: e.message.toString(),
      );
    } catch (e) {
      navigatorKey.currentState!.pop();
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.anUnexpectedError,
      );
    }
  }

  forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then(
        (value) {
          Get.back();
          Get.defaultDialog(
            title: StringConst.resetPassword,
            middleText: StringConst.passwordResetEmail,
          );
        },
      ).catchError(
        (e) {
          Get.defaultDialog(
            title: StringConst.error,
            middleText: e.message.toString(),
          );
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.anUnexpectedError,
      );
    }
  }
}

//TODO:
