//TODO:

class FindSelfGoalModel {
  late String goalId;
  late String goalCategoryName;
  late String goalDescription;
  late int weekDuration;
  late int successDay;

  FindSelfGoalModel({
    required this.goalId,
    required this.goalCategoryName,
    required this.goalDescription,
    required this.weekDuration,
    required this.successDay,
  });
}

class FindGoalModel1 {
  late String goalId;
  late String goalCategoryName;
  late int weekDuration;

  FindGoalModel1({
    required this.goalId,
    required this.goalCategoryName,
    required this.weekDuration,
  });
}

class FindGoalModel2 {
  late String userId;
  late int avatar;
  late String userName;
  late String userDescription;

  late bool expandedVal;
  late bool checkboxVal;

  FindGoalModel2({
    required this.userId,
    required this.avatar,
    required this.userName,
    required this.userDescription,
    required this.expandedVal,
    required this.checkboxVal,
  });
}

//TODO:
