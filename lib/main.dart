import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/views/pages/home/home.dart';
import 'package:duuit/views/pages/onboarding/avatar_choose_page.dart';
import 'package:duuit/views/pages/onboarding/forgot_password_page.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_1.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_2.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_3.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_4.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_5.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_6.dart';
import 'package:duuit/views/pages/onboarding/sign_in_page.dart';
import 'package:duuit/views/pages/onboarding/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
  ));

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConst.appTitle,
      navigatorKey: navigatorKey,
      theme: ThemeData.light().copyWith(
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      ),
      home: FutureBuilder(
        future: _authController.currentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingPage();
          } else if (snapshot.hasError) {
            return const ErrorPage();
          } else if (snapshot.hasData) {
            if (_authController.userInfo >= 1) {
              if (_authController.userGoalInfo >= 1) {
                return HomePage();
              } else {
                return OnboardingPage3();
              }
            } else {
              return OnboardingPage2();
            }
          } else {
            return const OnboardingPage1();
          }
        },
      ),
      getPages: [
        GetPage(name: OnboardingPage1.id, page: () => const OnboardingPage1()),
        GetPage(name: OnboardingPage2.id, page: () => OnboardingPage2()),
        GetPage(name: OnboardingPage3.id, page: () => OnboardingPage3()),
        GetPage(name: OnboardingPage4.id, page: () => OnboardingPage4()),
        GetPage(name: OnboardingPage5.id, page: () => OnboardingPage5()),
        GetPage(name: OnboardingPage6.id, page: () => OnboardingPage6()),
        GetPage(name: AvatarChoosePage.id, page: () => AvatarChoosePage()),
        GetPage(name: SignInPage.id, page: () => SignInPage()),
        GetPage(name: ForgotPasswordPage.id, page: () => ForgotPasswordPage()),
        GetPage(name: SignUpPage.id, page: () => SignUpPage()),
        GetPage(name: HomePage.id, page: () => HomePage()),
      ],
    );
  }
}
