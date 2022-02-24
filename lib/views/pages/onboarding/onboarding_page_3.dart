import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/add_goal_controller.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_4.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_choose_widgets/custom_choose_widget_1.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage3 extends StatelessWidget {
  OnboardingPage3({Key? key}) : super(key: key);
  static const id = '/OnboardingPage3';
  final AddGoalController _controller = Get.put(AddGoalController());

  void onTap(String string) {
    _controller.updateGoalCategory(string);
    Get.to(() => OnboardingPage4());
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: AppSizes.height10 * 1.5),
              const CustomTitle2(
                text: StringConst.whatBringsYouTo,
                coloredText: StringConst.appTitle,
              ),
              SizedBox(height: AppSizes.height10 * 3),
              CustomChooseWidget1(
                image1: ImageConst.reading,
                image2: ImageConst.meditate,
                onTap1: () {
                  onTap(StringConst.reading);
                },
                onTap2: () {
                  onTap(StringConst.meditate);
                },
              ),
              CustomChooseWidget1(
                image1: ImageConst.workout,
                image2: ImageConst.misc,
                onTap1: () {
                  onTap(StringConst.workout);
                },
                onTap2: () {
                  onTap(StringConst.misc);
                },
              ),
              SizedBox(height: AppSizes.height10 * 3),
              Center(
                child: Image.asset(ImageConst.g2, width: AppSizes.width10 * 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
