import 'package:duuit/const/string_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomCardWidget2 extends StatelessWidget {
  const CustomCardWidget2({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 3),
      child: Container(
        width: double.infinity,
        height: AppSizes.height10 * 11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.height10 * 1.5),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.height10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: AppSizes.height10 * 2.5,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringConst.nunitoSansFont),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      image,
                      height: AppSizes.height10 * 8,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
