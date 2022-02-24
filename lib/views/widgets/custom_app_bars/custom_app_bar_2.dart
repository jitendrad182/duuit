import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBar2 = AppBar(
  automaticallyImplyLeading: false,
  elevation: 0,
  toolbarHeight: AppSizes.height10 * 8,
  backgroundColor: ColorConst.primaryColor,
  systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(AppSizes.height10 * 3),
    ),
  ),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        ImageConst.logo,
        height: AppSizes.height10 * 3.8,
      ),
      SizedBox(width: AppSizes.height10 * 1.5),
      Image.asset(
        ImageConst.duuit,
        height: AppSizes.height10 * 2.7,
      ),
    ],
  ),
);
