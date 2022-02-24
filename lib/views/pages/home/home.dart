import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_3.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO:

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const id = '/HomePage';

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar3,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: AppSizes.height10 * 4),
        onPressed: () async {
          Get.to(() => OnboardingPage3());
        },
      ),
      bottomNavigationBar: bottomAppBar1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.height10 * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Obx(() {
              //       return _findSelfInfoController.userProfileModel.isEmpty
              //           ? const Center(child: CircularProgressIndicator())
              //           : Image.asset(
              //               "assets/avatars/avatar${_findSelfInfoController.userProfileModel[0].avatar}.png",
              //               height: AppSizes.height10 * 5,
              //             );
              //     }),
              //     SizedBox(width: AppSizes.width10),
              //     Obx(() {
              //       return _findSelfInfoController.userProfileModel.isEmpty
              //           ? const Center(child: CircularProgressIndicator())
              //           : Flexible(
              //               child: RichText(
              //                 text: TextSpan(
              //                   children: [
              //                     TextSpan(
              //                       text: "welcome ",
              //                       style: TextStyle(
              //                         fontSize: AppSizes.height10 * 2,
              //                         fontWeight: FontWeight.bold,
              //                         fontFamily: StringConst.nunitoSansFont,
              //                         color: ColorConst.blackColor,
              //                       ),
              //                     ),
              //                     TextSpan(
              //                       text: _findSelfInfoController
              //                           .userProfileModel[0].userName,
              //                       style: TextStyle(
              //                         fontSize: AppSizes.height10 * 2,
              //                         fontWeight: FontWeight.bold,
              //                         fontFamily: StringConst.nunitoSansFont,
              //                         color: ColorConst.primaryColor,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             );
              //     })
              //   ],
              // ),
              SizedBox(height: AppSizes.height10),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Continue with your goals',
                        style: TextStyle(
                          fontSize: AppSizes.height10 * 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringConst.nunitoSansFont,
                          color: ColorConst.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSizes.height10),
            ],
          ),
        ),
      ),
    );
  }
}

class WaitingPage extends StatelessWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      appBar: appBar1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConst.logo,
              height: AppSizes.height10 * 10,
            ),
            SizedBox(height: AppSizes.height10 * 2),
            Image.asset(
              ImageConst.duuit,
              height: AppSizes.height10 * 3.3,
            ),
            SizedBox(height: AppSizes.height10 * 4),
            const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar2,
      body: const Center(
        child: Text(StringConst.somethingWentWrong),
      ),
    );
  }
}

//TODO:
