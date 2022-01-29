import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/auth/auth.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bar_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO:
class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar1(),
              SizedBox(
                height: AppSizes.height10 * 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorConst.primaryColor,
                        size: AppSizes.height10 * 3.5,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: AppSizes.height10 * 3,
                    ),
                    Expanded(
                      child: Text(
                        'Welcome Back jbkdjkdsbjkdsfbjdfsbjdfsjbdfjb',
                        style: TextStyle(
                          fontSize: AppSizes.height10 * 3,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringConst.nunitoSansFont,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.height10 * 2.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 3),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (val) {},
                  onChanged: (value) {},
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    hintText: 'Choose a cool username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.height10 * 1.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 3),
                child: TextFormField(
                  maxLines: 6,
                  controller: _controllerPass,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Write about yourself',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.height10 * 2.5,
              ),
              GestureDetector(
                child: Container(
                  width: AppSizes.height10 * 20,
                  height: AppSizes.height10 * 4.5,
                  margin:
                      EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2),
                  decoration: BoxDecoration(
                    color: ColorConst.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.height10 * 1.8,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Auth().signInWithEmailAndPassword(
                      _controllerEmail.text, _controllerPass.text);
                },
              ),
              SizedBox(
                height: AppSizes.height10 * 2.5,
              ),
              GestureDetector(
                child: Container(
                  width: AppSizes.height10 * 20,
                  height: AppSizes.height10 * 4.5,
                  margin:
                      EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2),
                  decoration: BoxDecoration(
                    color: ColorConst.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.height10 * 1.8,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Auth().signInWithGoogle();
                },
              ),
              SizedBox(
                height: AppSizes.height10 * 2.5,
              ),
              GestureDetector(
                child: Container(
                  width: AppSizes.height10 * 20,
                  height: AppSizes.height10 * 4.5,
                  margin:
                      EdgeInsets.symmetric(horizontal: AppSizes.height10 * 2),
                  decoration: BoxDecoration(
                    color: ColorConst.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'FB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.height10 * 1.8,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Auth().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO:
