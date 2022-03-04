import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/controllers/create_profile_controller.dart';
import 'package:duuit/models/find_goal_model.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/services/db_1.dart';
import 'package:get/get.dart';

//TODO:

class FindBuddiesController extends GetxController {
  final RxList<FindGoalModel1> findGoalModel = <FindGoalModel1>[].obs;
  final RxList<FindGoalModel2> findGoalModel2 = <FindGoalModel2>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();

  //TODO:
  fetchBuddiesGoalInfo() async {
    if (_authController.isSignedIn == true) {
      await _firestore
          .collection(FirebaseConst.goals)
          .where(FirebaseConst.userId, isNotEqualTo: _authController.userId)
          .get()
          .then(
        (querySnapshot) async {
          for (var element in querySnapshot.docs) {
            findGoalModel.add(FindGoalModel1(
              goalId: element.id,
              goalCategoryName: element[FirebaseConst.goalCategoryName],
              weekDuration: element[FirebaseConst.weekDuration],
            ));
            await fetchBuddiesUserInfo(await element[FirebaseConst.userId]);
          }
        },
      );
    } else {
      await _firestore.collection(FirebaseConst.goals).get().then(
        (querySnapshot) async {
          for (var element in querySnapshot.docs) {
            findGoalModel.add(FindGoalModel1(
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
//TODO:

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
        expandedVal: false,
        checkboxVal: false,
      ));
    });
  }

  updateExpandedVal(int index) {
    if (findGoalModel2[index].expandedVal) {
      findGoalModel2[index].expandedVal = false;
    } else {
      findGoalModel2[index].expandedVal = true;
    }
  }

  updateCheckboxVal(int index) {
    if (findGoalModel2[index].checkboxVal) {
      findGoalModel2[index].checkboxVal = false;
    } else {
      findGoalModel2[index].checkboxVal = true;
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

  avatar(int index) {
    return ImageConst.avatar(findGoalModel2[index].avatar);
  }

  userName(int index) {
    return findGoalModel2[index].userName;
  }

  userDescription(int index) {
    return findGoalModel2[index].userDescription;
  }
}

class AddBuddiesModel {
  late String goalId;
  late String goalCategoryName;
  late int weekDuration;

  late int avatar;
  late String userName;
  late String userDescription;

  late bool expandedVal;

  AddBuddiesModel({
    required this.goalId,
    required this.goalCategoryName,
    required this.weekDuration,
    required this.avatar,
    required this.userName,
    required this.userDescription,
    required this.expandedVal,
  });
}

class AddBuddiesController extends GetxController {
  final RxList<AddBuddiesModel> addBuddiesModel = <AddBuddiesModel>[].obs;

  final FindBuddiesController _findBuddiesController = Get.find();

  addBuddies(int index) async {
    addBuddiesModel.add(AddBuddiesModel(
      goalId: _findBuddiesController.goalId(index),
      goalCategoryName: _findBuddiesController.goalCategoryName(index),
      weekDuration: _findBuddiesController.weekDuration(index),
      avatar: _findBuddiesController.findGoalModel2[index].avatar,
      userName: _findBuddiesController.findGoalModel2[index].userName,
      userDescription:
          _findBuddiesController.findGoalModel2[index].userDescription,
      expandedVal: false,
    ));
  }

  removeBuddies(int index) async {
    addBuddiesModel.removeWhere(
        (element) => element.goalId == _findBuddiesController.goalId(index));
  }

  updateExpandedVal(int index) {
    if (addBuddiesModel[index].expandedVal) {
      addBuddiesModel[index].expandedVal = false;
    } else {
      addBuddiesModel[index].expandedVal = true;
    }
  }

  goalCategoryName(int index) {
    return addBuddiesModel[index].goalCategoryName;
  }

  weekDuration(int index) {
    return addBuddiesModel[index].weekDuration;
  }

  avatar(int index) {
    return ImageConst.avatar(addBuddiesModel[index].avatar);
  }

  userName(int index) {
    return addBuddiesModel[index].userName;
  }

  userDescription(int index) {
    return addBuddiesModel[index].userDescription;
  }
}

class RecapController extends GetxController {
  final AuthController _authController = Get.find();

  bool? dbController2IsInitialized;
  bool? isSignedIn;
  late CreateProfileController _createProfileController;
  late DbController2 _dbController2;

  @override
  void onInit() {
    super.onInit();

    dbController2IsInitialized = _authController.dbController2IsInitialized;
    isSignedIn = _authController.isSignedIn;
    if (dbController2IsInitialized == true) {
      _dbController2 = Get.find();
    } else {
      _createProfileController = Get.find();
    }
  }

  avatar() {
    if (dbController2IsInitialized == true) {
      return ImageConst.avatar(_dbController2.userProfileModel[0].avatar);
    } else {
      return _createProfileController.avatarImageConst();
    }
  }

  userName() {
    if (dbController2IsInitialized == true) {
      return _dbController2.userProfileModel[0].userName;
    } else {
      return _createProfileController.userName();
    }
  }

  userDescription() {
    if (dbController2IsInitialized == true) {
      return _dbController2.userProfileModel[0].userDescription;
    } else {
      return _createProfileController.userDescription();
    }
  }
}

//TODO:
