import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/add_goal_controller.dart';
import 'package:duuit/utils/app_sizes.dart';
import 'package:duuit/utils/no_leading_space_formatter.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_5.dart';
import 'package:duuit/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:duuit/views/widgets/custom_buttons/custom_button_2.dart';
import 'package:duuit/views/widgets/custom_card_widgets/custom_card_widget_2.dart';
import 'package:duuit/views/widgets/custom_text_form_fields/custom_text_form_field_2.dart';
import 'package:duuit/views/widgets/custom_titles/custom_title_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage4 extends StatelessWidget {
  OnboardingPage4({Key? key}) : super(key: key);
  static const id = '/OnboardingPage4';

  final AddGoalController _controller = Get.find();

  final _key = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  void onTap() {
    if (_key.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      _controller.updateGoalDescription(_textEditingController.text.trim());
      Get.to(() => OnboardingPage5());
    }
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
              SizedBox(height: AppSizes.height10),
              const CustomTitle2(
                text: StringConst.whatBringsYouTo,
                coloredText: StringConst.appTitle,
              ),
              SizedBox(height: AppSizes.height10 * 1.5),
              CustomCardWidget2(
                color: _controller.categoryColorConst(),
                text: _controller.goalCategoryName(),
                image: _controller.categoryImageConst(),
              ),
              SizedBox(height: AppSizes.height10 * 1.7),
              Form(
                key: _key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CustomTextFormField2(
                  controller: _textEditingController,
                  maxLines: 4,
                  hintText: StringConst.iWouldLikeToAchieve,
                  labelText: StringConst.description,
                  validator: (val) {
                    if (GetUtils.isLengthGreaterOrEqual(val, 10)) {
                      return null;
                    } else {
                      return StringConst.chooseValidDescription10;
                    }
                  },
                  keyboardType: TextInputType.text,
                  inputFormatters: [NoLeadingSpaceFormatter()],
                  obscureText: false,
                ),
              ),
              SizedBox(height: AppSizes.height10 * 1.5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 3),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        StringConst.doItFor,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.width10 * 2),
                        child: Obx(
                          () => DropdownButtonFormField<int>(
                            value: _controller.weekDuration(),
                            items: <int>[1, 2, 3, 4]
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  '${value.toString()} ${StringConst.week}',
                                  style: const TextStyle(
                                      color: ColorConst.blackColor),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorConst.whiteColor,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: AppSizes.height10,
                                horizontal: AppSizes.width10 * 1.5,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            onChanged: (val) {
                              _controller.updateWeekDuration(val!.toInt());
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.height10 * 1.5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width10 * 3),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        StringConst.successDaysPerWeek,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.width10 * 2),
                        child: Obx(
                          () => DropdownButtonFormField<int>(
                            value: _controller.successDay(),
                            items: <int>[1, 2, 3, 4, 5, 6, 7]
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  '${value.toString()} ${StringConst.days}',
                                  style: const TextStyle(
                                      color: ColorConst.blackColor),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              _controller.updateSuccessDay(val!.toInt());
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorConst.whiteColor,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: AppSizes.height10,
                                horizontal: AppSizes.width10 * 1.5,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.height10 * 5),
              CustomButton2(
                text: StringConst.continueButtonString,
                onTap: onTap,
              ),
              SizedBox(height: AppSizes.height10 * 3),
              Center(
                child: Image.asset(ImageConst.g2, width: AppSizes.width10 * 5),
              ),
              SizedBox(height: AppSizes.height10),
            ],
          ),
        ),
      ),
    );
  }
}
