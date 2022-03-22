import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_2.dart';
import 'package:duuit/views/pages/onboarding/sign_in_page.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_button_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key? key}) : super(key: key);
  static const id = '/';

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar1,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConst.logo,
                      height: AppSizes.height10 * 10,
                    ),
                    SizedBox(height: AppSizes.height10 * 2),
                    Image.asset(
                      ImageConst.duuit,
                      height: AppSizes.height10 * 3.5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton1(
                    text: StringConst.getStarted,
                    color: ColorConst.primaryColor,
                    textColor: ColorConst.whiteColor,
                    onTap: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      Get.to(() => OnboardingPage2());
                    },
                  ),
                  SizedBox(height: AppSizes.height10 * 2.5),
                  CustomButton1(
                    text: StringConst.gotAnAccount,
                    color: ColorConst.whiteColor,
                    textColor: ColorConst.blackColor,
                    onTap: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      Get.to(() => SignInPage());
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
