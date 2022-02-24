import 'package:duuit/const/color_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: AppSizes.height10 * 4.5,
        margin: EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2),
        decoration: BoxDecoration(
          color: color,
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
        child: Center(
          child: Text(
            text,
            style:
                TextStyle(fontSize: AppSizes.height10 * 1.5, color: textColor),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
