import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/find_buddies_controller.dart';
import 'package:duuit/models/add_goal_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddGoalController extends GetxController {
  final Rx<AddGoalModel> _addGoal = AddGoalModel(
    goalCategoryName: StringConst.misc,
    goalDescription: 'Goal Description.......',
    weekDuration: 1,
    successDay: 4,
  ).obs;

  doThis() async {
    final findBuddiesController = Get.put(FindBuddiesController());
    findBuddiesController.fetchBuddiesGoalInfo();
  }

  @override
  void onInit() {
    super.onInit();
    doThis();
  }

  String goalCategoryName() {
    return _addGoal.value.goalCategoryName;
  }

  String categoryImageConst() {
    switch (_addGoal.value.goalCategoryName) {
      case StringConst.reading:
        return ImageConst.readingIcon;
      case StringConst.meditate:
        return ImageConst.meditateIcon;
      case StringConst.workout:
        return ImageConst.workoutIcon;
      case StringConst.misc:
        return ImageConst.miscIcon;
      default:
        return ImageConst.miscIcon;
    }
  }

  Color categoryColorConst() {
    switch (_addGoal.value.goalCategoryName) {
      case StringConst.reading:
        return ColorConst.readingColor;
      case StringConst.meditate:
        return ColorConst.meditateColor;
      case StringConst.workout:
        return ColorConst.workoutColor;
      case StringConst.misc:
        return ColorConst.miscColor;
      default:
        return ColorConst.miscColor;
    }
  }

  String goalDescription() {
    return _addGoal.value.goalDescription;
  }

  int weekDuration() {
    return _addGoal.value.weekDuration;
  }

  int successDay() {
    return _addGoal.value.successDay;
  }

  void updateGoalCategory(String goalCategoryName) {
    _addGoal.update((val) {
      val!.goalCategoryName = goalCategoryName;
    });
  }

  void updateGoalDescription(String goalDescription) {
    _addGoal.update((val) {
      val!.goalDescription = goalDescription;
    });
  }

  void updateWeekDuration(int weekDuration) {
    _addGoal.update((val) {
      val!.weekDuration = weekDuration;
    });
  }

  void updateSuccessDay(int successDay) {
    _addGoal.update((val) {
      val!.successDay = successDay;
    });
  }
}
