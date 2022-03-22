import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:get/get.dart';

class DbController5 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  saveRequestBuddiesInfo(
      String? selfGoalId, String? goalId, String? userId) async {
    return _firestore
        .collection(FirebaseConst.goals)
        .doc(selfGoalId)
        .collection(FirebaseConst.requestedBuddies)
        .doc(goalId)
        .set(
      {
        FirebaseConst.goalId: goalId,
        FirebaseConst.userId: userId,
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

  savePendingRequests(
      String? selfGoalId, String? goalId, String? selfUserId) async {
    return _firestore
        .collection(FirebaseConst.goals)
        .doc(goalId)
        .collection(FirebaseConst.pendingRequests)
        .doc(selfGoalId)
        .set(
      {
        FirebaseConst.goalId: selfGoalId,
        FirebaseConst.userId: selfUserId,
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

  saveSelfBuddiesInfo(String? selfUserId, String? userId) async {
    return _firestore
        .collection(FirebaseConst.users)
        .doc(selfUserId)
        .collection(FirebaseConst.buddies)
        .doc(userId)
        .set(
      {
        FirebaseConst.userId: userId,
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

  saveBuddiesInfo(String? selfUserId, String? userId) async {
    return _firestore
        .collection(FirebaseConst.users)
        .doc(userId)
        .collection(FirebaseConst.buddies)
        .doc(selfUserId)
        .set(
      {
        FirebaseConst.userId: selfUserId,
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
