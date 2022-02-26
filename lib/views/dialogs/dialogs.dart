import 'package:flutter/material.dart';

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
}
