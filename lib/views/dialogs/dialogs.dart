import 'package:duuit/const/string_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static circularProgressIndicatorDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  //TODO:
  static defaultErrorDialog1(String errorMessage) {
    return Get.defaultDialog(
      title: StringConst.error,
      middleText: errorMessage,
    );
  }

  static defaultDialog1(String title, String middleText) {
    return Get.defaultDialog(
      title: title,
      middleText: middleText,
    );
  }
  //TODO:
}
