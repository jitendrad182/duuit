import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: AppSizes.height10 * 2.5,
        ),
        GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: ColorConst.primaryColor,
            size: AppSizes.height10 * 3.5,
          ),
          onTap: () {
            Get.back();
          },
        ),
        Text(
          ' Welcome Back',
          style: TextStyle(
            fontSize: AppSizes.height10 * 3,
            fontWeight: FontWeight.bold,
            fontFamily: StringConst.nunitoSansFont,
          ),
        )
      ],
    );
  }
}
