import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/add_goal_controller.dart';
import 'package:duuit/controllers/create_profile_controller.dart';
import 'package:duuit/models/find_goal_model.dart';
import 'package:duuit/models/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

//TODO:
class DbController1 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CreateProfileController _createProfileController = Get.find();

  Future<void> saveUserInfo() async {
    User? user = _auth.currentUser;
    return _firestore.collection(FirebaseConst.users).doc(user!.uid).set(
      {
        FirebaseConst.userId: user.uid,
        FirebaseConst.avatar: _createProfileController.avatar(),
        FirebaseConst.userName: _createProfileController.userName(),
        FirebaseConst.userDescription:
            _createProfileController.userDescription(),
        FirebaseConst.userAuthProvider: user.providerData[0].providerId,
        FirebaseConst.userCreationTime: user.metadata.creationTime,
        FirebaseConst.lastUserNameChangeTime: user.metadata.creationTime,
      },
    ).catchError(
      (error) {
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      },
    );
  }
}

class DbController2 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<UserProfileModel> userProfileModel = <UserProfileModel>[].obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getMyInfo() async {
    try {
      await _firestore
          .collection(FirebaseConst.users)
          .doc(_auth.currentUser?.uid)
          .get()
          .then((querySnapshot) async {
        userProfileModel.add(UserProfileModel(
          userId: querySnapshot.data()![FirebaseConst.userId],
          avatar: querySnapshot.data()![FirebaseConst.avatar],
          userName: querySnapshot.data()![FirebaseConst.userName],
          userDescription: querySnapshot.data()![FirebaseConst.userDescription],
          userAuthProvider:
              querySnapshot.data()![FirebaseConst.userAuthProvider],
          userCreationTime:
              querySnapshot.data()![FirebaseConst.userCreationTime],
          lastUserNameChangeTime:
              querySnapshot.data()![FirebaseConst.lastUserNameChangeTime],
        ));
      });
    } catch (e) {
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.anUnexpectedError,
      );
    }
  }
}

class DbController3 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final AddGoalController _addGoalController = Get.find();

  saveUserGoalInfo() async {
    User? user = _auth.currentUser;
    return _firestore.collection(FirebaseConst.goals).add(
      {
        FirebaseConst.userId: user!.uid,
        FirebaseConst.goalCategoryName: _addGoalController.goalCategoryName(),
        FirebaseConst.goalDescription: _addGoalController.goalDescription(),
        FirebaseConst.weekDuration: _addGoalController.weekDuration(),
        FirebaseConst.successDay: _addGoalController.successDay(),
      },
    ).catchError(
      (error) {
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      },
    );
  }
}

class DbController4 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<FindSelfGoalModel> goalModel = <FindSelfGoalModel>[].obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getMyGoalInfo() async {
    try {
      await _firestore
          .collection(FirebaseConst.goals)
          .where(FirebaseConst.userId, isEqualTo: _auth.currentUser?.uid)
          .get()
          .then(
        (querySnapshot) {
          for (var element in querySnapshot.docs) {
            goalModel.add(FindSelfGoalModel(
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
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.anUnexpectedError,
      );
    }
  }
}

class DbController5 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  saveRequestBuddiesInfo(String? selfGoalId, String? goalId) async {
    return _firestore
        .collection(FirebaseConst.goals)
        .doc(selfGoalId)
        .collection(FirebaseConst.requestedBuddies)
        .add(
      {
        FirebaseConst.goalId: goalId,
      },
    ).catchError(
      (error) {
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      },
    );
  }

  savePendingRequests(String? selfGoalId, String? goalId) async {
    return _firestore
        .collection(FirebaseConst.goals)
        .doc(goalId)
        .collection(FirebaseConst.pendingRequests)
        .add(
      {
        FirebaseConst.goalId: selfGoalId,
      },
    ).catchError(
      (error) {
        Get.defaultDialog(
          title: StringConst.error,
          middleText: StringConst.anUnexpectedError,
        );
      },
    );
  }
}

//TODO:
