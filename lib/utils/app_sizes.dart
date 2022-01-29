import 'package:flutter/material.dart';

class AppSizes {
  static late double height10, width10;

  static mediaQueryHeightWidth(BuildContext context) {
    height10 = MediaQuery.of(context).size.height * 0.0118;
    width10 = MediaQuery.of(context).size.width * 0.0118 * 2.1;
  }
}
