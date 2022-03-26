import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/add_buddies_controller.dart';
import 'package:duuit/controllers/add_goal_controller.dart';
import 'package:duuit/controllers/recap_controller.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/services/db/db_1.dart';
import 'package:duuit/services/db/db_2.dart';
import 'package:duuit/services/db/db_3.dart';
import 'package:duuit/services/db/db_4.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/dialogs/dialogs.dart';
import 'package:duuit/views/pages/home/home.dart';
import 'package:duuit/views/pages/onboarding/sign_up_page.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_button_2.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_button_3.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO:
class OnboardingPage6 extends StatelessWidget {
  OnboardingPage6({Key? key}) : super(key: key);
  static const id = '/OnboardingPage6';

  final AuthController _authController = Get.find();
  final AddBuddiesController _addBuddiesController = Get.find();
  final AddGoalController _addGoalController = Get.find();

  final RecapController _recapController = Get.put(RecapController());
  final DbController3 _dbController3 = Get.put(DbController3());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.height10),
            const CustomTitle2(
              text: StringConst.soTo,
              coloredText: StringConst.recap,
            ),
            SizedBox(height: AppSizes.height10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 2),
              child: Row(
                children: [
                  Image.asset(
                    _recapController.avatarImageConst(),
                    height: AppSizes.height10 * 12,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.width10 * 1.5)
                          .copyWith(right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _recapController.userName(),
                            style: TextStyle(
                                fontSize: AppSizes.height10 * 2.2,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _recapController.userDescription(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: TextStyle(
                              fontSize: AppSizes.height10 * 1.5,
                              color: ColorConst.greyColor,
                            ),
                          ),
                          SizedBox(height: AppSizes.height10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.height10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Read ",
                            style: TextStyle(
                              fontSize: AppSizes.height10 * 2.7,
                              fontWeight: FontWeight.bold,
                              fontFamily: StringConst.nunitoSansFont,
                              color: ColorConst.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: "for ",
                            style: TextStyle(
                              fontSize: AppSizes.height10 * 2.7,
                              fontWeight: FontWeight.bold,
                              fontFamily: StringConst.nunitoSansFont,
                              color: ColorConst.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: "2 weeks",
                            style: TextStyle(
                              fontSize: AppSizes.height10 * 2.7,
                              fontWeight: FontWeight.bold,
                              fontFamily: StringConst.nunitoSansFont,
                              color: ColorConst.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Goal Description",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: AppSizes.height10 * 2,
                      fontWeight: FontWeight.bold,
                      fontFamily: StringConst.nunitoSansFont,
                      color: ColorConst.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: AppSizes.height10 * 1.5),
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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _addGoalController.goalDescription(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: AppSizes.height10 * 1.5,
                    color: ColorConst.greyColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSizes.height10 * 1.5),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Send ",
                            style: TextStyle(
                              fontSize: AppSizes.height10 * 2.7,
                              fontWeight: FontWeight.bold,
                              fontFamily: StringConst.nunitoSansFont,
                              color: ColorConst.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: "request ",
                            style: TextStyle(
                              fontSize: AppSizes.height10 * 2.7,
                              fontWeight: FontWeight.bold,
                              fontFamily: StringConst.nunitoSansFont,
                              color: ColorConst.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: "to",
                            style: TextStyle(
                              fontSize: AppSizes.height10 * 2.7,
                              fontWeight: FontWeight.bold,
                              fontFamily: StringConst.nunitoSansFont,
                              color: ColorConst.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.height10 * 1.5),
            Expanded(
              child: Obx(() {
                return _addBuddiesController.isEmpty()
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _addBuddiesController.length(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Obx(() {
                                return _addBuddiesController.expanded(index)
                                    ? CustomExpansionPanel4(
                                        controller: _addBuddiesController,
                                        index: index,
                                      )
                                    : CustomExpansionPanel3(
                                        controller: _addBuddiesController,
                                        index: index,
                                      );
                              }),
                              SizedBox(height: AppSizes.height10 * 1.5),
                            ],
                          );
                        },
                      );
              }),
            ),
            SizedBox(height: AppSizes.height10 * 1.5),
            CustomButton2(
              text: 'Finalize',
              onTap: () async {
                if (_authController.isSignedIn == true) {
                  if (_authController.createProfileControllerIsInitialized ==
                      true) {
                    Dialogs.circularProgressIndicatorDialog(context);
                    await DbController1().saveUserInfo().then((value) async {
                      final DbController3 dbController3 = Get.find();
                      await dbController3.saveUserGoalInfo().then((val) async {
                        final DbController2 dbController2 =
                            Get.put(DbController2(), permanent: true);
                        final DbController4 dbController4 =
                            Get.put(DbController4(), permanent: true);
                        await dbController2.getMyInfo();
                        await dbController4.getMyGoalInfo();
                        final AddBuddiesController addBuddiesController =
                            Get.find();
                        await addBuddiesController
                            .saveBuddies(dbController3.docId);
                        _authController.userInfo = dbController2.length();
                        _authController.userGoalInfo = dbController4.length();
                        _authController.createProfileControllerIsInitialized =
                            false;
                        Get.offAll(() => HomePage());
                      });
                    });
                  } else {
                    Dialogs.circularProgressIndicatorDialog(context);
                    _dbController3.saveUserGoalInfo().then((val) async {
                      final DbController2 dbController2 = Get.find();
                      final DbController4 dbController4 = Get.find();
                      await dbController2.getMyInfo();
                      await dbController4.getMyGoalInfo();
                      await _addBuddiesController
                          .saveBuddies(_dbController3.docId);
                      _authController.userInfo = dbController2.length();
                      _authController.userGoalInfo = dbController4.length();
                      _authController.createProfileControllerIsInitialized =
                          false;
                      Get.offAll(() => HomePage());
                    });
                  }
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return SizedBox(
                          height: AppSizes.height10 * 30,
                          child: Container(
                            color: ColorConst.whiteColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.width10,
                                  vertical: AppSizes.height10 * 2),
                              child: Column(
                                children: [
                                  Text(
                                    'Add Account',
                                    style: TextStyle(
                                        fontSize: AppSizes.height10 * 2.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: AppSizes.height10 * 3,
                                  ),
                                  CustomButton3(
                                    text: StringConst.signUpWithGoogle,
                                    image: ImageConst.google,
                                    color: ColorConst.whiteColor,
                                    onTap: () {
                                      _authController.signInWithGoogle(
                                          isSignInPage: false,
                                          context: context);
                                    },
                                  ),
                                  SizedBox(
                                    height: AppSizes.height10 * 2,
                                  ),
                                  CustomButton3(
                                    text: StringConst.signUpWithFb,
                                    image: ImageConst.fb,
                                    color: ColorConst.whiteColor,
                                    onTap: () {
                                      _authController.signInWithFacebook(
                                          isSignInPage: false,
                                          context: context);
                                    },
                                  ),
                                  SizedBox(
                                    height: AppSizes.height10 * 2,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: AppSizes.height10 * 4.5,
                                      decoration: BoxDecoration(
                                        color: ColorConst.whiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorConst.greyColor
                                                .withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 8,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: AppSizes.height10,
                                            horizontal: AppSizes.width10 * 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.email,
                                              size: AppSizes.height10 * 2.3,
                                              color: ColorConst.primaryColor,
                                            ),
                                            SizedBox(width: AppSizes.width10),
                                            Text(
                                              StringConst.signUpWithEmail,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConst.blackColor,
                                                fontSize:
                                                    AppSizes.height10 * 1.8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Get.to(() => SignUpPage());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
              },
            ),
            SizedBox(height: AppSizes.height10 * 2),
            Center(
              child: Image.asset(ImageConst.g4, width: AppSizes.width10 * 5),
            ),
            SizedBox(height: AppSizes.height10),
          ],
        ),
      ),
    );
  }
}

class CustomExpansionPanel3 extends StatelessWidget {
  const CustomExpansionPanel3({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final AddBuddiesController controller;
  final int index;
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
              SizedBox(
                width: AppSizes.width10 * 1.5,
              ),
              Expanded(
                child: GestureDetector(
                  child: Image.asset(
                    controller.avatar(index),
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
                                controller.userName(index),
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
                                controller.goalCategoryName(index),
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: AppSizes.width10 * 1.3),
                              ),
                              Text(
                                'For ${controller.weekDuration(index)} weeks',
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
                    controller.updateExpandedVal(index);
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

class CustomExpansionPanel4 extends StatelessWidget {
  const CustomExpansionPanel4(
      {Key? key, required this.controller, required this.index})
      : super(key: key);

  final AddBuddiesController controller;
  final int index;

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
                  SizedBox(
                    width: AppSizes.width10 * 1.5,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Image.asset(
                        controller.avatar(index),
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
                                      controller.userName(index),
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
                                      controller.goalCategoryName(index),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: AppSizes.width10 * 1.3),
                                    ),
                                    Text(
                                      'For ${controller.weekDuration(index)} weeks',
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
                          controller.updateExpandedVal(index);
                        }),
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
                child: Text(controller.userDescription(index)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO:
