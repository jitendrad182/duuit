import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/home/home.dart';
import 'package:duuit/views/pages/home/profile_page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

AppBar appBar3 = AppBar(
  centerTitle: true,
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
  actions: [
    PopupMenuButton(
      color: ColorConst.primaryColor,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            title: const Text(
              StringConst.notification,
              style: TextStyle(
                color: ColorConst.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Get.to(() => NotificationPage1());
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: const Text(
              StringConst.profile,
              style: TextStyle(
                color: ColorConst.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Get.to(() => ProfilePage1());
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: const Text(
              StringConst.signOut,
              style: TextStyle(
                color: ColorConst.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              final AuthController _controller = Get.find();
              await _controller.signOut();
            },
          ),
        ),
      ],
    )
  ],
);
