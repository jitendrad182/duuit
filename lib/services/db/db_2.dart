import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/image_const.dart';
import 'package:duuit/models/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DbController2 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<UserProfileModel> _userProfileModel = <UserProfileModel>[].obs;

  Future getMyInfo() async {
    _userProfileModel.removeRange(0, _userProfileModel.length);
    try {
      await _firestore
          .collection(FirebaseConst.users)
          .doc(_auth.currentUser?.uid)
          .get()
          .then((querySnapshot) async {
        _userProfileModel.add(UserProfileModel(
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
      if (kDebugMode) {
        print('DbController2 getMyInfo Error == $e');
      }
    }
  }

  length() {
    return _userProfileModel.length;
  }

  avatarImageConst() {
    return ImageConst.avatarImageConst(_userProfileModel[0].avatar);
  }

  userName() {
    return _userProfileModel[0].userName;
  }

  userDescription() {
    return _userProfileModel[0].userDescription;
  }
}
