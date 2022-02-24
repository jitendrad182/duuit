import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle2 extends StatelessWidget {
  const CustomTitle2({Key? key, required this.text, required this.coloredText})
      : super(key: key);
  final String text;
  final String coloredText;

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
                    text: text,
                    style: TextStyle(
                      fontSize: AppSizes.height10 * 3,
                      fontWeight: FontWeight.bold,
                      fontFamily: StringConst.nunitoSansFont,
                      color: ColorConst.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: coloredText,
                    style: TextStyle(
                      fontSize: AppSizes.height10 * 3,
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
    );
  }
}
