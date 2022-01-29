import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/auth/auth.dart';
import 'package:duuit/views/pages/home/home.dart';
import 'package:duuit/views/pages/onboarding/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConst.appTitle,
      //TODO:
      theme: ThemeData.light().copyWith(),
      //TODO:
      home: FutureBuilder(
        future: Auth().currentUser(),
        builder: (context, snapshot) {
          return snapshot.hasData ? Home() : SignInPage();
        },
      ),
    );
  }
}
