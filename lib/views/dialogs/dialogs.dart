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

  static defaultDialog1() {
    return Get.defaultDialog(
      title: StringConst.error,
      middleText: StringConst.anUnexpectedError,
    );
  }

  static defaultDialog2(String errorMessage) {
    return Get.defaultDialog(
      title: StringConst.error,
      middleText: errorMessage,
    );
  }
}
