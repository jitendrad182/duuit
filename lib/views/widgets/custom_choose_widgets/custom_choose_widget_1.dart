import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomChooseWidget1 extends StatelessWidget {
  const CustomChooseWidget1({
    Key? key,
    required this.image1,
    required this.image2,
    required this.onTap1,
    required this.onTap2,
  }) : super(key: key);
  final String image1;
  final String image2;
  final void Function()? onTap1;
  final void Function()? onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Center(
            child: Image.asset(
              image1,
              height: AppSizes.height10 * 14,
            ),
          ),
          onTap: onTap1,
        ),
        GestureDetector(
          child: Center(
            child: Image.asset(
              image2,
              height: AppSizes.height10 * 14,
            ),
          ),
          onTap: onTap2,
        ),
      ],
    );
  }
}
