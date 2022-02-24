import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle3 extends StatelessWidget {
  const CustomTitle3({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: ColorConst.primaryColor,
              size: AppSizes.height10 * 3.6,
            ),
            onTap: () {
              Get.back();
            },
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: AppSizes.height10 * 3,
                color: ColorConst.primaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: StringConst.nunitoSansFont,
              ),
            ),
          )
        ],
      ),
    );
  }
}
