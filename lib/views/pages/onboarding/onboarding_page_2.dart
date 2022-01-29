import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/services/auth/auth.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/views/widgets/custom_app_bar_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppSizes.height10 * 2.5,
                  ),
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
                  Text(
                    ' Create profile',
                    style: TextStyle(
                      fontSize: AppSizes.height10 * 3,
                      fontWeight: FontWeight.bold,
                      fontFamily: StringConst.nunitoSansFont,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppSizes.height10 * 2.5,
              ),
              //TODO:
              GestureDetector(
                child: Center(
                  child: Image.asset(
                    ImageConst.avatar1,
                    height: AppSizes.height10 * 12,
                  ),
                ),
                onTap: () {},
              ),
              //TODO:
              SizedBox(
                height: AppSizes.height10 * 2.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 3),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (val) {},
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
                      'Continue ›',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.height10 * 1.8,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Auth().signOut();
                },
              ),
              SizedBox(
                height: AppSizes.height10 * 5,
              ),
              Center(
                child: Image.asset(
                  ImageConst.g1,
                  width: AppSizes.width10 * 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class OnboardingPage2Model {
//   int avatar;
//   String userName;
//   String userDescription;
//
//   OnboardingPage2Model({
//     required this.avatar,
//     required this.userName,
//     required this.userDescription,
//   });
// }
//
// class OnboardingPage2Controller extends GetxController {
//   final Rx<OnboardingPage2Model> _onboardingPage2Model =
//       OnboardingPage2Model(avatar: 1, userName: '', userDescription: '').obs;
//
//   void updateAvatar(int avatar) {
//     _onboardingPage2Model.update((val) {
//       val!.avatar = avatar;
//     });
//   }
//
//   void updateUserName(String userName) {
//     _onboardingPage2Model.update((val) {
//       val!.userName = userName;
//     });
//   }
//
//   void updateUserDescription(String userDescription) {
//     _onboardingPage2Model.update((val) {
//       val!.userDescription = userDescription;
//     });
//   }
// }
