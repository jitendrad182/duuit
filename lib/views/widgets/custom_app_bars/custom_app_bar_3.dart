import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//TODO:
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
              Get.to(() => const NotificationPage1());
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
              Get.to(() => const ProfilePage1());
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
              AuthController _controller = Get.find();
              await _controller.signOut();
            },
          ),
        ),
      ],
    )
  ],
);

class NotificationPage1 extends StatelessWidget {
  const NotificationPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

BottomAppBar bottomAppBar1 = BottomAppBar(
  shape: const CircularNotchedRectangle(),
  notchMargin: 7,
  child: Padding(
    padding:
        EdgeInsets.symmetric(vertical: AppSizes.height10).copyWith(bottom: 0),
    child: Row(
      //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.home,
            size: AppSizes.height10 * 3.5,
            color: ColorConst.greyColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.chat,
            size: AppSizes.height10 * 3.5,
            color: ColorConst.greyColor,
          ),
          onPressed: () {},
        ),
      ],
    ),
  ),
);

FloatingActionButton floatingActionButton1 = FloatingActionButton(
  child: Icon(Icons.add, size: AppSizes.height10 * 4),
  onPressed: () {
    // _dbController1.saveUserInfo(userAuthProvider: 'fb');
  },
);
//TODO:
