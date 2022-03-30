import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/home/discover_buddies_page_1.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingActionButton1 extends StatelessWidget {
  const CustomFloatingActionButton1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, size: AppSizes.height10 * 4),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return SizedBox(
                height: AppSizes.height10 * 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConst.goal,
                            height: AppSizes.height10 * 10,
                          ),
                          SizedBox(height: AppSizes.height10),
                          const Text(StringConst.addGoal)
                        ],
                      ),
                      onTap: () {
                        Get.to(() => OnboardingPage3());
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConst.buddie,
                            height: AppSizes.height10 * 10,
                          ),
                          SizedBox(height: AppSizes.height10),
                          const Text(StringConst.addBuddies)
                        ],
                      ),
                      onTap: () {
                        Get.to(() => DiscoverBuddiesPage1());
                      },
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
