import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/views/dialogs/dialogs.dart';
import 'package:get/get.dart';

class DbController6 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find();

  Future saveSelfChatRooms(String userId) async {
    return await _firestore
        .collection(FirebaseConst.chats)
        .doc(_authController.userId)
        .collection(FirebaseConst.chatRooms)
        .doc(userId)
        .set(
      {
        FirebaseConst.userId: userId,
      },
    ).catchError(
      (error) {
        Dialogs.defaultDialog1();
      },
    );
  }

  Future saveChatRooms(String userId) async {
    return await _firestore
        .collection(FirebaseConst.chats)
        .doc(userId)
        .collection(FirebaseConst.chatRooms)
        .doc(_authController.userId)
        .set(
      {
        FirebaseConst.userId: _authController.userId,
      },
    ).catchError(
      (error) {
        Dialogs.defaultDialog1();
      },
    );
  }

  Future saveSelfChats(String userId, String message, String messageBy) async {
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
    ).catchError(
      (error) {
        Dialogs.defaultDialog1();
      },
    );
  }

  Future saveChats(String userId, String message, String messageBy) async {
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
    ).catchError(
      (error) {
        Dialogs.defaultDialog1();
      },
    );
  }
}
