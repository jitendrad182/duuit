import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/bindings/home_binding.dart';
import 'package:duuit/const/string_const.dart';
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

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int? userInfo;
  int? userGoalInfo;

  currentUser() async {
    await getUserInfo();
    await getUserGoalInfo();
    return _auth.currentUser;
  }

  getUserInfo() async {
    await _firestore
        .collection('users')
        .where('userId', isEqualTo: _auth.currentUser?.uid.toString())
        .get()
        .then((querySnapshot) async {
      userInfo = querySnapshot.docs.length;
    });
  }

  getUserGoalInfo() async {
    await _firestore
        .collection('goals')
        .where('userId', isEqualTo: _auth.currentUser?.uid.toString())
        .get()
        .then(
      (querySnapshot) async {
        userGoalInfo = querySnapshot.docs.length;
      },
    );
  }

  uid() async {
    return _auth.currentUser?.uid;
  }

  creationTime() async {
    return _auth.currentUser!.metadata.creationTime;
  }

  lastSignInTime() async {
    return _auth.currentUser!.metadata.creationTime;
  }

  authProviderId() async {
    return _auth.currentUser!.providerData[0].providerId;
  }

  signOut() async {
    await _googleSignIn.signOut();
    await _facebookAuth.logOut();
    await _auth.signOut();
    Get.offAll(() => const OnboardingPage1());
  }

  //TODO:
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
        await DbController1().saveUserInfo(user: user).then((value) async {
          await DbController3().saveUserGoalInfo(user: user).then((val) async {
            await getUserInfo();
            await getUserGoalInfo();
            Get.offAll(() => HomePage(), binding: HomeBinding());
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
          await DbController1().saveUserInfo(user: user).then((value) async {
            await DbController3().saveUserGoalInfo(user: user).then((val) {
              Get.offAll(() => HomePage(), binding: HomeBinding());
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
          await DbController1().saveUserInfo(user: user).then((value) async {
            await DbController3().saveUserGoalInfo(user: user).then((val) {
              Get.offAll(() => HomePage(), binding: HomeBinding());
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

  //TODO:
}
