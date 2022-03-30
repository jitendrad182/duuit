import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/db/db_2.dart';
import 'package:duuit/services/db/db_4.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_3.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_bottom_app_bar_1.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_floating_action_button_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO:
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final DbController2 _dbController2 = Get.find();
  final DbController4 _dbController4 = Get.find();

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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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

class NotificationPage1 extends StatelessWidget {
  NotificationPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
