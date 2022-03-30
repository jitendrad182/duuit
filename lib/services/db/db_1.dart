import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/controllers/create_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DbController1 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CreateProfileController _createProfileController = Get.find();

  Future<void> saveUserInfo() async {
    User? user = _auth.currentUser;
    try {
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
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController1 saveUserInfo Error == $e');
      }
    }
  }
}
