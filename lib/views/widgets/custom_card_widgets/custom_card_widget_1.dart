import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomCardWidget1 extends StatelessWidget {
  const CustomCardWidget1({
    Key? key,
    required this.color,
    required this.text,
    required this.image,
  }) : super(key: key);
  final Color color;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width10 * 13,
      height: AppSizes.height10 * 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.height10 * 1.5),
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.height10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: AppSizes.height10 * 1.8,
                      fontWeight: FontWeight.bold,
                      fontFamily: StringConst.nunitoSansFont,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    image,
                    height: AppSizes.height10 * 6,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
