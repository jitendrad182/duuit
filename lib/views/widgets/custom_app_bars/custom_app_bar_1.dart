import 'package:duuit/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBar1 = AppBar(
  toolbarHeight: 0,
  elevation: 0,
  systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
  ),
);
