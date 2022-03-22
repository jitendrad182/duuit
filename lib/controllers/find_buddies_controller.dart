import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/models/find_goal_model_1.dart';
import 'package:duuit/models/find_goal_model_2.dart';
import 'package:duuit/services/auth.dart';
import 'package:get/get.dart';

class FindBuddiesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();

  final RxList<FindGoalModel1> _findGoalModel = <FindGoalModel1>[].obs;
  final RxList<FindGoalModel2> _findGoalModel2 = <FindGoalModel2>[].obs;
  final RxList<bool> _expandedVal = <bool>[].obs;
  final RxList<bool> _checkboxVal = <bool>[].obs;

  fetchBuddiesGoalInfo(String goalCategoryName) async {
    _findGoalModel.removeRange(0, _findGoalModel.length);
    _findGoalModel2.removeRange(0, _findGoalModel2.length);
    _expandedVal.removeRange(0, _expandedVal.length);
    _checkboxVal.removeRange(0, _checkboxVal.length);
    if (_authController.isSignedIn == true) {
      await _firestore
          .collection(FirebaseConst.goals)
          .where(FirebaseConst.userId, isNotEqualTo: _authController.userId)
          .where(FirebaseConst.goalCategoryName, isEqualTo: goalCategoryName)
          .get()
          .then(
        (querySnapshot) async {
          for (var element in querySnapshot.docs) {
            _findGoalModel.add(FindGoalModel1(
              goalId: element.id,
              goalCategoryName: element[FirebaseConst.goalCategoryName],
              weekDuration: element[FirebaseConst.weekDuration],
            ));
            await fetchBuddiesUserInfo(await element[FirebaseConst.userId]);
          }
        },
      );
    } else {
      await _firestore
          .collection(FirebaseConst.goals)
          .where(FirebaseConst.goalCategoryName, isEqualTo: goalCategoryName)
          .get()
          .then(
        (querySnapshot) async {
          for (var element in querySnapshot.docs) {
            _findGoalModel.add(FindGoalModel1(
              goalId: element.id,
              goalCategoryName: element[FirebaseConst.goalCategoryName],
              weekDuration: element[FirebaseConst.weekDuration],
            ));
            await fetchBuddiesUserInfo(await element[FirebaseConst.userId]);
          }
        },
      );
    }
  }

  fetchBuddiesUserInfo(String userId) async {
    await _firestore
        .collection(FirebaseConst.users)
        .doc(userId)
        .get()
        .then((querySnapshot) async {
      _findGoalModel2.add(FindGoalModel2(
        userId: querySnapshot.id,
        avatar: querySnapshot.data()![FirebaseConst.avatar],
        userName: querySnapshot.data()![FirebaseConst.userName],
        userDescription: querySnapshot.data()![FirebaseConst.userDescription],
      ));
      _expandedVal.add(false);
      _checkboxVal.add(false);
    });
  }

  length() {
    return _findGoalModel2.length;
  }

  expanded(int index) {
    return _expandedVal[index];
  }

  checkbox(int index) {
    return _checkboxVal[index];
  }

  updateExpandedVal(int index) {
    if (_expandedVal[index]) {
      _expandedVal[index] = false;
    } else {
      _expandedVal[index] = true;
    }
  }

  updateCheckboxVal(int index) {
    if (_checkboxVal[index]) {
      _checkboxVal[index] = false;
    } else {
      _checkboxVal[index] = true;
    }
  }

  goalId(int index) {
    return _findGoalModel[index].goalId;
  }

  userId(int index) {
    return _findGoalModel2[index].userId;
  }

  goalCategoryName(int index) {
    return _findGoalModel[index].goalCategoryName;
  }

  weekDuration(int index) {
    return _findGoalModel[index].weekDuration;
  }

  avatar(int index) {
    return _findGoalModel2[index].avatar;
  }

  avatarImageConst(int index) {
    return ImageConst.avatarImageConst(_findGoalModel2[index].avatar);
  }

  userName(int index) {
    return _findGoalModel2[index].userName;
  }

  userDescription(int index) {
    return _findGoalModel2[index].userDescription;
  }
}
