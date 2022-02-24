import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/models/find_goal_model.dart';
import 'package:duuit/models/user_profile_model.dart';
import 'package:duuit/views/pages/onboarding/onboarding_page_6.dart';
import 'package:get/get.dart';

//TODO:

class FindBuddiesController extends GetxController {
  final RxList<FindGoalModel> goalModel = <FindGoalModel>[].obs;
  final RxList<UserProfileModel> userProfileModel = <UserProfileModel>[].obs;

  final RxList<bool> isExpanded = <bool>[].obs;
  final RxList<bool> isAdded = <bool>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchBuddiesGoalInfo();
  }

  fetchBuddiesGoalInfo() async {
    await _firestore.collection('goals').get().then(
      (querySnapshot) async {
        for (var element in querySnapshot.docs) {
          goalModel.add(FindGoalModel(
            goalId: element.id,
            goalCategoryName: element['goalCategoryName'],
            goalDescription: element['goalDescription'],
            weekDuration: element['weekDuration'],
            successDay: element['successDay'],
          ));
          await fetchBuddiesUserInfo(await element['userId']);
          isExpanded.add(false);
          isAdded.add(false);
        }
      },
    );
  }

  fetchBuddiesUserInfo(String userId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .get()
        .then((querySnapshot) async {
      userProfileModel.add(UserProfileModel(
        userId: querySnapshot.id,
        avatar: querySnapshot.data()!['avatar'],
        userName: querySnapshot.data()!['userName'],
        userDescription: querySnapshot.data()!['userDescription'],
        userAuthProvider: querySnapshot.data()!['userAuthProvider'],
        userCreationTime: querySnapshot.data()!['userCreationTime'],
        lastUserNameChangeTime: querySnapshot.data()!['lastUserNameChangeTime'],
      ));
    });
  }

  expanded(int index) {
    return isExpanded[index];
  }

  updateExpanded(int index) {
    if (isExpanded[index]) {
      isExpanded[index] = false;
    } else {
      isExpanded[index] = true;
    }
  }

  checkbox(int index) {
    return isAdded[index];
  }

  updateCheckbox(int index) {
    if (isAdded[index]) {
      isAdded[index] = false;
    } else {
      isAdded[index] = true;
    }
  }

  goalCategoryName(int index) {
    return goalModel[index].goalCategoryName;
  }

  goalDescription(int index) {
    return goalModel[index].goalDescription;
  }

  weekDuration(int index) {
    return goalModel[index].weekDuration;
  }

  successDay(int index) {
    return goalModel[index].successDay;
  }

  avatar(int index) {
    return "assets/avatars/avatar${userProfileModel[index].avatar}.png";
  }

  userName(int index) {
    return userProfileModel[index].userName;
  }

  userDescription(int index) {
    return userProfileModel[index].userDescription;
  }
}

class AddBuddiesController extends GetxController {
  final RxList<FindGoalModel> goalModel = <FindGoalModel>[].obs;
  final RxList<UserProfileModel> userProfileModel = <UserProfileModel>[].obs;

  final RxList<bool> isExpand = <bool>[].obs;

  addBuddies(FindBuddiesController controller) async {
    goalModel.removeRange(0, goalModel.length);
    userProfileModel.removeRange(0, userProfileModel.length);
    isExpand.removeRange(0, isExpand.length);

    for (int index = 0; index < controller.isAdded.length; index++) {
      if (controller.isAdded[index] == true) {
        goalModel.add(FindGoalModel(
          goalId: controller.goalModel[index].goalId,
          goalCategoryName: controller.goalCategoryName(index),
          goalDescription: controller.goalDescription(index),
          weekDuration: controller.weekDuration(index),
          successDay: controller.successDay(index),
        ));
        userProfileModel.add(UserProfileModel(
          userId: controller.userProfileModel[index].userId,
          avatar: controller.userProfileModel[index].avatar,
          userName: controller.userName(index),
          userDescription: controller.userDescription(index),
          userAuthProvider: controller.userProfileModel[index].userAuthProvider,
          userCreationTime: controller.userProfileModel[index].userCreationTime,
          lastUserNameChangeTime:
              controller.userProfileModel[index].lastUserNameChangeTime,
        ));
        isExpand.add(false);
      }
    }
    if (goalModel.isEmpty) {
      Get.defaultDialog(
        title: StringConst.error,
        middleText: StringConst.atLeastAddOneBuddie,
      );
    } else {
      Get.to(() => OnboardingPage6());
    }
  }

  expanded(int index) {
    return isExpand[index];
  }

  updateExpanded(int index) {
    if (isExpand[index]) {
      isExpand[index] = false;
    } else {
      isExpand[index] = true;
    }
  }

  goalCategoryName(int index) {
    return goalModel[index].goalCategoryName;
  }

  goalDescription(int index) {
    return goalModel[index].goalDescription;
  }

  weekDuration(int index) {
    return goalModel[index].weekDuration;
  }

  successDay(int index) {
    return goalModel[index].successDay;
  }

  avatar(int index) {
    return "assets/avatars/avatar${userProfileModel[index].avatar}.png";
  }

  userName(int index) {
    return userProfileModel[index].userName;
  }

  userDescription(int index) {
    return userProfileModel[index].userDescription;
  }
}

//TODO:
