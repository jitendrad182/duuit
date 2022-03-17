import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/models/find_goal_model_1.dart';
import 'package:duuit/models/find_goal_model_2.dart';
import 'package:duuit/services/auth.dart';
import 'package:get/get.dart';

class FindBuddiesController extends GetxController {
  final RxList<FindGoalModel1> findGoalModel = <FindGoalModel1>[].obs;
  final RxList<FindGoalModel2> findGoalModel2 = <FindGoalModel2>[].obs;

  final RxList<bool> expandedVal = <bool>[].obs;
  final RxList<bool> checkboxVal = <bool>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final AuthController _authController = Get.find();

  fetchBuddiesGoalInfo(String goalCategoryName) async {
    findGoalModel.removeRange(0, findGoalModel.length);
    findGoalModel2.removeRange(0, findGoalModel2.length);
    expandedVal.removeRange(0, expandedVal.length);
    checkboxVal.removeRange(0, checkboxVal.length);
    if (_authController.isSignedIn == true) {
      await _firestore
          .collection(FirebaseConst.goals)
          .where(FirebaseConst.userId, isNotEqualTo: _authController.userId)
          .where(FirebaseConst.goalCategoryName, isEqualTo: goalCategoryName)
          .get()
          .then(
        (querySnapshot) async {
          for (var element in querySnapshot.docs) {
            findGoalModel.add(FindGoalModel1(
              goalId: element.id,
              goalCategoryName: element[FirebaseConst.goalCategoryName],
              weekDuration: element[FirebaseConst.weekDuration],
            ));
            await fetchBuddiesUserInfo(
              await element[FirebaseConst.userId],
            );
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
            findGoalModel.add(FindGoalModel1(
              goalId: element.id,
              goalCategoryName: element[FirebaseConst.goalCategoryName],
              weekDuration: element[FirebaseConst.weekDuration],
            ));
            await fetchBuddiesUserInfo(
              await element[FirebaseConst.userId],
            );
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
      findGoalModel2.add(FindGoalModel2(
        userId: querySnapshot.id,
        avatar: querySnapshot.data()![FirebaseConst.avatar],
        userName: querySnapshot.data()![FirebaseConst.userName],
        userDescription: querySnapshot.data()![FirebaseConst.userDescription],
      ));
      expandedVal.add(false);
      checkboxVal.add(false);
    });
  }

  updateExpandedVal(int index) {
    if (expandedVal[index]) {
      expandedVal[index] = false;
    } else {
      expandedVal[index] = true;
    }
  }

  updateCheckboxVal(int index) {
    if (checkboxVal[index]) {
      checkboxVal[index] = false;
    } else {
      checkboxVal[index] = true;
    }
  }

  goalId(int index) {
    return findGoalModel[index].goalId;
  }

  goalCategoryName(int index) {
    return findGoalModel[index].goalCategoryName;
  }

  weekDuration(int index) {
    return findGoalModel[index].weekDuration;
  }

  avatarImageConst(int index) {
    return ImageConst.avatar(findGoalModel2[index].avatar);
  }

  userName(int index) {
    return findGoalModel2[index].userName;
  }

  userDescription(int index) {
    return findGoalModel2[index].userDescription;
  }
}
