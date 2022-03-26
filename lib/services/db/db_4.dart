import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/color_const.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/models/find_self_goal_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DbController4 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<FindSelfGoalModel> _goalModel = <FindSelfGoalModel>[].obs;

  Future getMyGoalInfo() async {
    _goalModel.removeRange(0, _goalModel.length);
    try {
      await _firestore
          .collection(FirebaseConst.goals)
          .where(FirebaseConst.userId, isEqualTo: _auth.currentUser?.uid)
          .orderBy(FirebaseConst.creationTime, descending: true)
          .get()
          .then(
        (querySnapshot) {
          for (var element in querySnapshot.docs) {
            _goalModel.add(FindSelfGoalModel(
              goalId: element.id,
              goalCategoryName: element[FirebaseConst.goalCategoryName],
              goalDescription: element[FirebaseConst.goalDescription],
              weekDuration: element[FirebaseConst.weekDuration],
              successDay: element[FirebaseConst.successDay],
            ));
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error == $e');
      }
    }
  }

  length() {
    return _goalModel.length;
  }

  isEmpty() {
    return _goalModel.isEmpty;
  }

  goalId(int index) {
    return _goalModel[index].goalId;
  }

  goalCategoryName(int index) {
    return _goalModel[index].goalCategoryName;
  }

  goalCategoryImageConst(int index) {
    return ImageConst.goalCategoryImageConst(
      _goalModel[index].goalCategoryName,
    );
  }

  goalCategoryColorConst(int index) {
    return ColorConst.goalCategoryColorConst(
      _goalModel[index].goalCategoryName,
    );
  }

  goalDescription(int index) {
    return _goalModel[index].goalDescription;
  }

  successDayString(int index) {
    if (_goalModel[index].successDay == 7) {
      return 'Everyday';
    } else {
      return '${_goalModel[index].successDay} days per week';
    }
  }
}
