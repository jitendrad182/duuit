import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_2.dart';
import 'package:duuit/views/pages/onboarding/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConst.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppSizes.height10 * 5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConst.logo,
                      height: AppSizes.height10 * 11,
                    ),
                    SizedBox(height: AppSizes.height10 * 2),
                    Image.asset(
                      ImageConst.duuit,
                      height: AppSizes.height10 * 4,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      height: AppSizes.height10 * 4.5,
                      margin: EdgeInsets.symmetric(
                          horizontal: AppSizes.height10 * 2),
                      decoration: BoxDecoration(
                        color: ColorConst.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppSizes.height10 * 1.8,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(OnboardingPage2());
                    },
                  ),
                  SizedBox(height: AppSizes.height10 * 2.5),
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      height: AppSizes.height10 * 4.5,
                      margin: EdgeInsets.symmetric(
                          horizontal: AppSizes.height10 * 2),
                      decoration: BoxDecoration(
                        color: ColorConst.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Got an account? Sign in here.',
                          style: TextStyle(fontSize: AppSizes.height10 * 1.5),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(SignInPage());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
