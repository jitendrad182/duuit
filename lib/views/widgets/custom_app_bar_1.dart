import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomAppBar1 extends StatelessWidget {
  const CustomAppBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth(context);
    return Container(
      height: AppSizes.height10 * 10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConst.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSizes.height10 * 3.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConst.logo,
            height: AppSizes.height10 * 4.2,
          ),
          SizedBox(width: AppSizes.height10 * 1.5),
          Image.asset(
            ImageConst.duuit,
            height: AppSizes.height10 * 3,
          ),
        ],
      ),
    );
  }
}
