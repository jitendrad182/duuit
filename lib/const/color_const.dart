import 'package:duuit/const/string_const.dart';
import 'package:flutter/material.dart';

class ColorConst {
  static Color goalCategoryColorConst(String goalCategoryName) {
    switch (goalCategoryName) {
      case StringConst.reading:
        return readingColor;
      case StringConst.meditate:
        return meditateColor;
      case StringConst.workout:
        return workoutColor;
      case StringConst.misc:
        return miscColor;
      default:
        return miscColor;
    }
  }

  static const Color primaryColor = Color(0xFF1071E2);

  static const Color readingColor = Color(0xFF89EAFF);
  static const Color meditateColor = Color(0xFFA1A5FF);
  static const Color workoutColor = Color(0xFFBFEB62);
  static const Color miscColor = Color(0xFFFFB076);

  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;

  //TODO:
  static const Color greenColor = Colors.green;
  //TODO:
}
