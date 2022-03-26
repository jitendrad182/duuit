import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/models/find_goal_model_2.dart';
import 'package:duuit/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

//TODO:
class ChatRoomPageController1 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();

  final RxList<FindGoalModel2> _userProfileModel = <FindGoalModel2>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBuddies();
  }

  fetchBuddies() async {
    _userProfileModel.removeRange(0, _userProfileModel.length);
    await _firestore
        .collection(FirebaseConst.users)
        .doc(_authController.userId)
        .collection(FirebaseConst.buddies)
        .get()
        .then((querySnapshot) async {
      for (var element in querySnapshot.docs) {
        await fetchBuddiesUserInfo(await element[FirebaseConst.userId]);
      }
    });
  }

  fetchBuddiesUserInfo(String userId) async {
    await _firestore
        .collection(FirebaseConst.users)
        .doc(userId)
        .get()
        .then((querySnapshot) async {
      _userProfileModel.add(FindGoalModel2(
        userId: querySnapshot.data()![FirebaseConst.userId],
        avatar: querySnapshot.data()![FirebaseConst.avatar],
        userName: querySnapshot.data()![FirebaseConst.userName],
        userDescription: querySnapshot.data()![FirebaseConst.userDescription],
      ));
    });
  }

  length() {
    return _userProfileModel.length;
  }

  isEmpty() {
    return _userProfileModel.isEmpty;
  }

  avatarImageConst(int index) {
    return ImageConst.avatarImageConst(_userProfileModel[index].avatar);
  }

  userId(int index) {
    return _userProfileModel[index].userId;
  }

  avatar(int index) {
    return _userProfileModel[index].avatar;
  }

  userName(int index) {
    return _userProfileModel[index].userName;
  }

  userDescription(int index) {
    return _userProfileModel[index].userDescription;
  }
}

class ChatRoomPageController2 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();

  final RxList<FindGoalModel2> _userProfileModel = <FindGoalModel2>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchChatRooms();
  }

  fetchChatRooms() async {
    _userProfileModel.removeRange(0, _userProfileModel.length);
    try {
      await _firestore
          .collection(FirebaseConst.chats)
          .doc(_authController.userId)
          .collection(FirebaseConst.chatRooms)
          .get()
          .then((querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          for (var element in querySnapshot.docs) {
            await fetchBuddiesUserInfo(await element[FirebaseConst.userId]);
          }
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error == $e");
      }
    }
  }

  fetchBuddiesUserInfo(String userId) async {
    await _firestore
        .collection(FirebaseConst.users)
        .doc(userId)
        .get()
        .then((querySnapshot) async {
      _userProfileModel.add(FindGoalModel2(
        userId: querySnapshot.data()![FirebaseConst.userId],
        avatar: querySnapshot.data()![FirebaseConst.avatar],
        userName: querySnapshot.data()![FirebaseConst.userName],
        userDescription: querySnapshot.data()![FirebaseConst.userDescription],
      ));
    });
  }

  length() {
    return _userProfileModel.length;
  }

  isEmpty() {
    return _userProfileModel.isEmpty;
  }

  avatarImageConst(int index) {
    return ImageConst.avatarImageConst(_userProfileModel[index].avatar);
  }

  userId(int index) {
    return _userProfileModel[index].userId;
  }

  avatar(int index) {
    return _userProfileModel[index].avatar;
  }

  userName(int index) {
    return _userProfileModel[index].userName;
  }

  userDescription(int index) {
    return _userProfileModel[index].userDescription;
  }
}

class ChatPageController extends GetxController {
  final RxList<FindGoalModel2> _userProfileModel = <FindGoalModel2>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();

  saveBuddies1(ChatRoomPageController1 controller, int index) {
    _userProfileModel.removeRange(0, _userProfileModel.length);
    _userProfileModel.add(FindGoalModel2(
      userId: controller.userId(index),
      avatar: controller.avatar(index),
      userName: controller.userName(index),
      userDescription: controller.userDescription(index),
    ));
  }

  saveBuddies2(ChatRoomPageController2 controller, int index) {
    _userProfileModel.removeRange(0, _userProfileModel.length);
    _userProfileModel.add(FindGoalModel2(
      userId: controller.userId(index),
      avatar: controller.avatar(index),
      userName: controller.userName(index),
      userDescription: controller.userDescription(index),
    ));
  }

  getChats(String userId) async {
    try {
      return _firestore
          .collection(FirebaseConst.chats)
          .doc(_authController.userId)
          .collection(FirebaseConst.chatRooms)
          .doc(userId)
          .collection(FirebaseConst.chat)
          .orderBy(FirebaseConst.messageTs, descending: true)
          .snapshots();
    } catch (e) {
      if (kDebugMode) {
        print('Error == $e');
      }
    }
  }

  avatarImageConst() {
    return ImageConst.avatarImageConst(_userProfileModel[0].avatar);
  }

  userId() {
    return _userProfileModel[0].userId;
  }

  avatar() {
    return _userProfileModel[0].avatar;
  }

  userName() {
    return _userProfileModel[0].userName;
  }

  userDescription() {
    return _userProfileModel[0].userDescription;
  }
}
//TODO:
