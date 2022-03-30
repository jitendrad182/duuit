import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/find_buddies_controller.dart';
import 'package:duuit/services/db/db_4.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_card_widgets/custom_card_widget_1.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO:
class DiscoverBuddiesPage1 extends StatelessWidget {
  DiscoverBuddiesPage1({Key? key}) : super(key: key);

  final DbController4 _dbController4 = Get.find();
  final _findBuddiesController = Get.put(FindBuddiesController());

  length() {
    double length = (_dbController4.length() / 2);
    return length.toInt();
  }

  int index2(int index) {
    var result = index + (_dbController4.length() / 2);
    return result.toInt();
  }

  void onTap() async {
    _findBuddiesController.fetchBuddiesGoalInfo2();
    Get.to(() => DiscoverBuddiesPage2());
  }

  void onTap2(String string) async {
    _findBuddiesController.fetchBuddiesGoalInfo(string);
    Get.to(() => DiscoverBuddiesPage2());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.height10 * 1.5),
              const CustomTitle1(text: StringConst.discoverBuddies),
              SizedBox(height: AppSizes.height10 * 1.6),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.width10 * 2.5),
                child: Text(
                  StringConst.findBuddiesForCurrentGoals,
                  style: TextStyle(fontSize: AppSizes.width10 * 1.9),
                ),
              ),
              SizedBox(height: AppSizes.height10 * 1.6),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: length(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Center(
                              child: CustomCardWidget1(
                                  color: _dbController4
                                      .goalCategoryColorConst(index),
                                  text: _dbController4.goalCategoryName(index),
                                  image: _dbController4
                                      .goalCategoryImageConst(index)),
                            ),
                            onTap: () {
                              onTap();
                            },
                          ),
                          GestureDetector(
                              child: Center(
                                child: CustomCardWidget1(
                                    color: _dbController4
                                        .goalCategoryColorConst(index2(index)),
                                    text: _dbController4
                                        .goalCategoryName(index2(index)),
                                    image: _dbController4
                                        .goalCategoryImageConst(index2(index))),
                              ),
                              onTap: () {
                                onTap();
                              })
                        ],
                      ),
                      SizedBox(height: AppSizes.height10 * 1.6),
                    ],
                  );
                },
              ),
              _dbController4.length() % 2 == 0
                  ? const SizedBox(height: 0)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            child: Center(
                              child: CustomCardWidget1(
                                  color: _dbController4.goalCategoryColorConst(
                                      _dbController4.length() - 1),
                                  text: _dbController4.goalCategoryName(
                                      _dbController4.length() - 1),
                                  image: _dbController4.goalCategoryImageConst(
                                      _dbController4.length() - 1)),
                            ),
                            onTap: () {
                              onTap();
                            }),
                      ],
                    ),
              SizedBox(height: AppSizes.height10 * 1.6),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.width10 * 2.5),
                child: Text(
                  StringConst.findBuddiesPursuing,
                  style: TextStyle(fontSize: AppSizes.width10 * 1.9),
                ),
              ),
              SizedBox(height: AppSizes.height10 * 1.6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: const Center(
                      child: CustomCardWidget1(
                        color: ColorConst.readingColor,
                        text: StringConst.reading,
                        image: ImageConst.reading,
                      ),
                    ),
                    onTap: () {
                      onTap();
                    },
                  ),
                  // GestureDetector(
                  //     child: Center(
                  //       child: CustomCardWidget1(
                  //           color: _dbController4
                  //               .goalCategoryColorConst(index2(index)),
                  //           text:
                  //               _dbController4.goalCategoryName(index2(index)),
                  //           image: _dbController4
                  //               .goalCategoryImageConst(index2(index))),
                  //     ),
                  //     onTap: () {
                  //       onTap();
                  //     })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscoverBuddiesPage2 extends StatelessWidget {
  DiscoverBuddiesPage2({Key? key}) : super(key: key);

  final DbController4 _dbController4 = Get.find();
  final _findBuddiesController = Get.put(FindBuddiesController());

  length() {
    double length = (_dbController4.length() / 2);
    return length.toInt();
  }

  int index2(int index) {
    var result = index + (_dbController4.length() / 2);
    return result.toInt();
  }

  void onTap() async {
    _findBuddiesController.fetchBuddiesGoalInfo2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.height10 * 1.5),
              const CustomTitle1(text: StringConst.discoverBuddies),
              SizedBox(height: AppSizes.height10 * 1.6),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.width10 * 2.5),
                child: Text(
                  StringConst.findBuddiesForCurrentGoals,
                  style: TextStyle(fontSize: AppSizes.width10 * 1.9),
                ),
              ),
              SizedBox(height: AppSizes.height10 * 1.6),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: length(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Center(
                              child: CustomCardWidget1(
                                  color: _dbController4
                                      .goalCategoryColorConst(index),
                                  text: _dbController4.goalCategoryName(index),
                                  image: _dbController4
                                      .goalCategoryImageConst(index)),
                            ),
                            onTap: () {
                              onTap();
                            },
                          ),
                          GestureDetector(
                              child: Center(
                                child: CustomCardWidget1(
                                    color: _dbController4
                                        .goalCategoryColorConst(index2(index)),
                                    text: _dbController4
                                        .goalCategoryName(index2(index)),
                                    image: _dbController4
                                        .goalCategoryImageConst(index2(index))),
                              ),
                              onTap: () {
                                onTap();
                              })
                        ],
                      ),
                      SizedBox(height: AppSizes.height10 * 1.6),
                    ],
                  );
                },
              ),
              _dbController4.length() % 2 == 0
                  ? const SizedBox(height: 0)
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                child: Center(
                                  child: CustomCardWidget1(
                                      color:
                                          _dbController4.goalCategoryColorConst(
                                              _dbController4.length() - 1),
                                      text: _dbController4.goalCategoryName(
                                          _dbController4.length() - 1),
                                      image:
                                          _dbController4.goalCategoryImageConst(
                                              _dbController4.length() - 1)),
                                ),
                                onTap: () {
                                  onTap();
                                }),
                          ],
                        ),
                        SizedBox(height: AppSizes.height10 * 1.6),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectGoalPage extends StatelessWidget {
  const SelectGoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//TODO:
