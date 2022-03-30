import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:flutter/material.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      appBar: appBar1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConst.logo,
              height: AppSizes.height10 * 10,
            ),
            SizedBox(height: AppSizes.height10 * 2),
            Image.asset(
              ImageConst.duuit,
              height: AppSizes.height10 * 3.3,
            ),
            SizedBox(height: AppSizes.height10 * 4),
            const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
