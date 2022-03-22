import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/chat_room_controller.dart';
import 'package:duuit/controllers/find_buddies_controller.dart';
import 'package:duuit/services/db/db_2.dart';
import 'package:duuit/services/db/db_4.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_3.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_bottom_app_bar_1.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_floating_action_button_1.dart';
import 'package:duuit/views/widgets/custom_choose_widgets/custom_choose_widget_1.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO:
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const id = '/HomePage';
  final DbController2 _dbController2 = Get.find();
  final DbController4 _dbController4 = Get.find();

  final _controller1 = Get.put(ChatRoomPageController1());
  final _controller2 = Get.put(ChatRoomPageController2());

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar3,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton1(),
      bottomNavigationBar: const CustomBottomAppBar1(),
      body: SafeArea(
        child: Obx(() {
          return _dbController4.isEmpty()
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(AppSizes.height10 * 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            _dbController2.avatarImageConst(),
                            height: AppSizes.height10 * 5,
                          ),
                          SizedBox(width: AppSizes.width10),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "welcome ",
                                    style: TextStyle(
                                      fontSize: AppSizes.height10 * 2,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: StringConst.nunitoSansFont,
                                      color: ColorConst.blackColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: _dbController2.userName(),
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
                          )
                        ],
                      ),
                      SizedBox(height: AppSizes.height10),
                      Row(
                        children: [
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
                        ],
                      ),
                      SizedBox(height: AppSizes.height10),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _dbController4.length(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: AppSizes.height10 * 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppSizes.height10 * 1.5),
                                    color: _dbController4
                                        .goalCategoryColorConst(index),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(AppSizes.height10 * 0.7),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _dbController4
                                                    .goalCategoryName(index),
                                                style: TextStyle(
                                                    fontSize:
                                                        AppSizes.height10 * 2.5,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: StringConst
                                                        .nunitoSansFont),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    _dbController4
                                                        .goalDescription(index),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize:
                                                            AppSizes.height10 *
                                                                1.7,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: StringConst
                                                            .nunitoSansFont),
                                                  ),
                                                  Text(
                                                    _dbController4
                                                        .successDayString(
                                                            index),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize:
                                                            AppSizes.height10 *
                                                                1.7,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: StringConst
                                                            .nunitoSansFont),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Image.asset(
                                                _dbController4
                                                    .goalCategoryImageConst(
                                                        index),
                                                height: AppSizes.height10 * 11,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSizes.height10 * 1.5),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}

class AddBuddiesPage1 extends StatelessWidget {
  AddBuddiesPage1({Key? key}) : super(key: key);
  static const id = '/OnboardingPage3';

  final DbController4 _dbController4 = Get.find();
  final _findBuddiesController = Get.put(FindBuddiesController());

  void onTap(String string) {
    _findBuddiesController.fetchBuddiesGoalInfo(string);
    Get.to(() => AddBuddiesPage2());
  }

  int itemCount() {
    double item = _dbController4.length() / 2;
    return item.toInt();
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
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorConst.primaryColor,
                        size: AppSizes.height10 * 3.8,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Discover Buddies',
                              style: TextStyle(
                                fontSize: AppSizes.height10 * 3,
                                fontWeight: FontWeight.bold,
                                fontFamily: StringConst.nunitoSansFont,
                                color: ColorConst.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.height10 * 3),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCount(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: AppSizes.height10 * 1.5),
                      ],
                    );
                  },
                ),
              ),
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

class AddBuddiesPage2 extends StatelessWidget {
  AddBuddiesPage2({Key? key}) : super(key: key);
  static const id = '/OnboardingPage3';

  final _findBuddiesController = Get.put(FindBuddiesController());

  void onTap(String string) {
    _findBuddiesController.fetchBuddiesGoalInfo(string);
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

class NotificationPage1 extends StatelessWidget {
  NotificationPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ProfilePage1 extends StatelessWidget {
  ProfilePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
