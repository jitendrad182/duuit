import 'package:duuit/const/color_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: AppSizes.height10 * 4.5,
        decoration: BoxDecoration(
          color: ColorConst.primaryColor,
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
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.height10, horizontal: AppSizes.width10 * 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst.whiteColor,
                  fontSize: AppSizes.height10 * 1.8,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
