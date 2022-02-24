import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/create_profile_controller.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvatarChoosePage extends StatelessWidget {
  AvatarChoosePage({Key? key}) : super(key: key);
  static const id = '/AvatarChoosePage';

  final CreateProfileController _controller = Get.find();

  void onTap(int i) {
    _controller.updateAvatar(i);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.height10 * 1.5),
            const CustomTitle1(text: StringConst.chooseAvatar),
            SizedBox(height: AppSizes.height10 * 2.5),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 55,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Center(
                          child: Image.asset(
                            ImageConst.avatar(index + 1),
                            height: AppSizes.height10 * 14,
                          ),
                        ),
                        onTap: () {
                          onTap(index + 1);
                        },
                      ),
                      GestureDetector(
                        child: Center(
                          child: Image.asset(
                            ImageConst.avatar(index + 56),
                            height: AppSizes.height10 * 14,
                          ),
                        ),
                        onTap: () {
                          onTap(index + 56);
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
