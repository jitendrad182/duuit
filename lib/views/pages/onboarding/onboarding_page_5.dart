import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/add_buddies_controller.dart';
import 'package:duuit/controllers/find_buddies_controller.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_6.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_button_2.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO:
class OnboardingPage5 extends StatelessWidget {
  OnboardingPage5({Key? key}) : super(key: key);
  static const id = '/OnboardingPage5';

  final FindBuddiesController _findBuddiesController = Get.find();
  final _addBuddiesController = Get.put(AddBuddiesController());

  onTap() {
    if (_addBuddiesController.isEmpty()) {
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.atLeastAddOneBuddie,
      );
    } else {
      Get.to(() => OnboardingPage6());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: Obx(
          () {
            return _findBuddiesController.length() < 2
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: AppSizes.height10),
                      const CustomTitle2(
                        text: StringConst.lets,
                        coloredText: StringConst.appTitle,
                      ),
                      SizedBox(height: AppSizes.height10 * 0.5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.width10 * 2.5),
                        child: Text(
                          StringConst.findBuddiesToDoTask,
                          style: TextStyle(fontSize: AppSizes.width10 * 2),
                        ),
                      ),
                      SizedBox(height: AppSizes.height10),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _findBuddiesController.length(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Obx(
                                  () {
                                    return _findBuddiesController
                                            .expanded(index)
                                        ? CustomExpansionPanel2(
                                            findBuddiesController:
                                                _findBuddiesController,
                                            index: index,
                                            addBuddiesController:
                                                _addBuddiesController,
                                          )
                                        : CustomExpansionPanel1(
                                            findBuddiesController:
                                                _findBuddiesController,
                                            index: index,
                                            addBuddiesController:
                                                _addBuddiesController,
                                          );
                                  },
                                ),
                                SizedBox(height: AppSizes.height10 * 1.5),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: AppSizes.height10 * 1.5),
                      Center(
                        child: CustomButton2(
                          text: StringConst.continueButtonString,
                          onTap: onTap,
                        ),
                      ),
                      SizedBox(height: AppSizes.height10 * 1.3),
                      Center(
                        child: Image.asset(
                          ImageConst.g3,
                          width: AppSizes.width10 * 5,
                        ),
                      ),
                      SizedBox(height: AppSizes.height10),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class CustomExpansionPanel1 extends StatelessWidget {
  const CustomExpansionPanel1({
    Key? key,
    required this.findBuddiesController,
    required this.index,
    required this.addBuddiesController,
  }) : super(key: key);

  final FindBuddiesController findBuddiesController;
  final int index;

  final AddBuddiesController addBuddiesController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 1.5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: ColorConst.greyColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.height10),
          child: Row(
            children: [
              Obx(
                () {
                  return Checkbox(
                    value: findBuddiesController.checkbox(index),
                    onChanged: (val) {
                      if (val == true) {
                        addBuddiesController.addBuddies(
                            index, findBuddiesController);
                      } else {
                        addBuddiesController.removeBuddies(
                            index, findBuddiesController);
                      }
                    },
                  );
                },
              ),
              Expanded(
                child: GestureDetector(
                  child: Image.asset(
                    findBuddiesController.avatarImageConst(index),
                    height: AppSizes.height10 * 5.5,
                  ),
                  //TODO:
                  onTap: () {},
                  //TODO:
                ),
              ),
              Expanded(
                flex: 5,
                child: GestureDetector(
                  child: Container(
                    color: ColorConst.whiteColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.width10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                findBuddiesController.userName(index),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSizes.height10 * 1.5),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.width10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                findBuddiesController.goalCategoryName(index),
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: AppSizes.width10 * 1.3),
                              ),
                              Text(
                                'For ${findBuddiesController.weekDuration(index)} weeks',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: AppSizes.width10 * 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    findBuddiesController.updateExpandedVal(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomExpansionPanel2 extends StatelessWidget {
  const CustomExpansionPanel2({
    Key? key,
    required this.findBuddiesController,
    required this.index,
    required this.addBuddiesController,
  }) : super(key: key);

  final FindBuddiesController findBuddiesController;
  final int index;

  final AddBuddiesController addBuddiesController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 1.5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: ColorConst.greyColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(
                    () {
                      return Checkbox(
                        value: findBuddiesController.checkbox(index),
                        onChanged: (val) {
                          if (val == true) {
                            addBuddiesController.addBuddies(
                                index, findBuddiesController);
                          } else {
                            addBuddiesController.removeBuddies(
                                index, findBuddiesController);
                          }
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Image.asset(
                        findBuddiesController.avatarImageConst(index),
                        height: AppSizes.height10 * 5.5,
                      ),
                      //TODO:
                      onTap: () {},
                      //TODO:
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      child: Container(
                        color: ColorConst.whiteColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.width10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    findBuddiesController.userName(index),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.keyboard_arrow_up_rounded),
                                ],
                              ),
                            ),
                            SizedBox(height: AppSizes.height10 * 1.5),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.width10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    findBuddiesController
                                        .goalCategoryName(index),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: AppSizes.width10 * 1.3),
                                  ),
                                  Text(
                                    'For ${findBuddiesController.weekDuration(index)} weeks',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: AppSizes.width10 * 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        findBuddiesController.updateExpandedVal(index);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.width10 * 1.5),
                child: const Divider(thickness: 2),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.width10 * 1.5),
                child: const Text(StringConst.description),
              ),
              SizedBox(height: AppSizes.height10),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.width10 * 1.5),
                child: Text(findBuddiesController.userDescription(index)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO:
