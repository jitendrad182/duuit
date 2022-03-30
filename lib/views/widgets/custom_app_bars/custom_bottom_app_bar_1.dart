import 'package:duuit/const/color_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/pages/chat/chat_room_page.dart';
import 'package:duuit/views/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar1 extends StatelessWidget {
  const CustomBottomAppBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 7,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.height10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: AppSizes.height10 * 3.5,
                color: ColorConst.greyColor,
              ),
              onPressed: () {
                if (Get.currentRoute != '/' &&
                    Get.currentRoute != "/HomePage") {
                  Get.offAll(() => HomePage());
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.telegram_outlined,
                size: AppSizes.height10 * 3.7,
                color: ColorConst.greyColor,
              ),
              onPressed: () {
                Get.to(() => ChatRoomPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
