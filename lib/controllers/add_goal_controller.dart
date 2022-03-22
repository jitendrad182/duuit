import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/models/add_goal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGoalController extends GetxController {
  final Rx<AddGoalModel> _addGoal = AddGoalModel(
    goalCategoryName: 'Misc.',
    goalDescription: 'Goal Description.......',
    weekDuration: 1,
    successDay: 4,
  ).obs;

  String goalCategoryName() {
    return _addGoal.value.goalCategoryName;
  }

  String goalCategoryImageConst() {
    return ImageConst.goalCategoryImageConst(_addGoal.value.goalCategoryName);
  }

  Color goalCategoryColorConst() {
    return ColorConst.goalCategoryColorConst(_addGoal.value.goalCategoryName);
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
      updateGoalDescription('Goal Description.......');
      updateWeekDuration(1);
      updateSuccessDay(4);
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
