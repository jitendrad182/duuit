import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/utils/no_leading_trailing_space_formatter.dart';
import 'package:duuit/views/pages/onboarding/forgot_password_page.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_button_2.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_button_3.dart';
import 'package:duuit/views/widgets/custom_text_form_fields/custom_text_form_field_1.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final AuthController _controller = Get.find();

  void signInWithEmail(BuildContext context) async {
    if (_key.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      await _controller.signInWithEmail(
        _emailController.text.trim(),
        _passController.text.trim(),
        context,
      );
    }
  }

  void signInWithFacebook(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    await _controller.signInWithFacebook(true, context);
  }

  void signInWithGoogle(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    await _controller.signInWithGoogle(true, context);
  }

  void onTap() {
    FocusManager.instance.primaryFocus!.unfocus();
    Get.to(() => ForgotPasswordPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: AppSizes.height10 * 1.2),
              const CustomTitle1(text: StringConst.welcomeBack),
              SizedBox(height: AppSizes.height10 * 2),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _key,
                child: Column(
                  children: [
                    CustomTextFormField1(
                      controller: _emailController,
                      maxLines: 1,
                      hintText: StringConst.email,
                      validator: (val) {
                        if (GetUtils.isEmail(val!)) {
                          return null;
                        } else {
                          return StringConst.validEmail;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
                      obscureText: false,
                    ),
                    SizedBox(height: AppSizes.height10 * 2),
                    CustomTextFormField1(
                      controller: _passController,
                      maxLines: 1,
                      hintText: StringConst.password,
                      validator: (val) {
                        if (GetUtils.isLengthGreaterOrEqual(val!, 8)) {
                          return null;
                        } else {
                          return StringConst.enterYourPassword;
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
                      obscureText: true,
                    ),
                    SizedBox(height: AppSizes.height10 * 2)
                  ],
                ),
              ),
              SizedBox(height: AppSizes.height10 * 2),
              CustomButton2(
                text: StringConst.signInWithEmail,
                onTap: () {
                  signInWithEmail(context);
                },
              ),
              SizedBox(height: AppSizes.height10 * 4),
              GestureDetector(
                child: Text(
                  StringConst.forgotYourPassword,
                  style: TextStyle(
                    fontSize: AppSizes.height10 * 1.8,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: onTap,
              ),
              SizedBox(height: AppSizes.height10 * 2),
              Text(
                StringConst.signInWith,
                style: TextStyle(
                  fontSize: AppSizes.height10 * 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: AppSizes.height10 * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton3(
                        text: StringConst.fb,
                        image: ImageConst.fb,
                        color: ColorConst.whiteColor,
                        onTap: () {
                          signInWithFacebook(context);
                        },
                      ),
                    ),
                    SizedBox(width: AppSizes.width10),
                    Expanded(
                      child: CustomButton3(
                        text: StringConst.google,
                        image: ImageConst.google,
                        color: ColorConst.whiteColor,
                        onTap: () {
                          signInWithGoogle(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
