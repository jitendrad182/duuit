import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

//TODO:
class DbController6 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();

  Future saveSelfChatRooms(String userId) async {
    try {
      return await _firestore
          .collection(FirebaseConst.chats)
          .doc(_authController.userId)
          .collection(FirebaseConst.chatRooms)
          .doc(userId)
          .set(
        {
          FirebaseConst.userId: userId,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController6 saveSelfChatRooms Error == $e');
      }
    }
  }

  Future saveChatRooms(String userId) async {
    try {
      return await _firestore
          .collection(FirebaseConst.chats)
          .doc(userId)
          .collection(FirebaseConst.chatRooms)
          .doc(_authController.userId)
          .set(
        {
          FirebaseConst.userId: _authController.userId,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController6 saveChatRooms Error == $e');
      }
    }
  }

  Future saveSelfChats(String userId, String message, String messageBy) async {
    try {
      return await _firestore
          .collection(FirebaseConst.chats)
          .doc(_authController.userId)
          .collection(FirebaseConst.chatRooms)
          .doc(userId)
          .collection(FirebaseConst.chat)
          .add(
        {
          FirebaseConst.message: message,
          FirebaseConst.messageTs: DateTime.now(),
          FirebaseConst.messageBy: messageBy,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController6 saveSelfChats Error == $e');
      }
    }
  }

  Future saveChats(String userId, String message, String messageBy) async {
    try {
      return await _firestore
          .collection(FirebaseConst.chats)
          .doc(userId)
          .collection(FirebaseConst.chatRooms)
          .doc(_authController.userId)
          .collection(FirebaseConst.chat)
          .add(
        {
          FirebaseConst.message: message,
          FirebaseConst.messageTs: DateTime.now(),
          FirebaseConst.messageBy: messageBy,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController6 saveChats Error == $e');
      }
    }
  }
}
//TODO:
