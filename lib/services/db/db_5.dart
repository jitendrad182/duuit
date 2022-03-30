import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DbController5 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  saveRequestedBuddiesInfo(
      String? selfGoalId, String? goalId, String? userId) async {
    try {
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
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController5 saveRequestedBuddiesInfo Error == $e');
      }
    }
  }

  savePendingRequests(
      String? selfGoalId, String? goalId, String? selfUserId) async {
    try {
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
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController5 savePendingRequests Error == $e');
      }
    }
  }

  saveSelfBuddiesInfo(String? selfUserId, String? userId) async {
    try {
      return _firestore
          .collection(FirebaseConst.users)
          .doc(selfUserId)
          .collection(FirebaseConst.buddies)
          .doc(userId)
          .set(
        {
          FirebaseConst.userId: userId,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController5 saveSelfBuddiesInfo Error == $e');
      }
    }
  }

  saveBuddiesInfo(String? selfUserId, String? userId) async {
    try {
      return _firestore
          .collection(FirebaseConst.users)
          .doc(userId)
          .collection(FirebaseConst.buddies)
          .doc(selfUserId)
          .set(
        {
          FirebaseConst.userId: selfUserId,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController5 saveBuddiesInfo Error == $e');
      }
    }
  }

  deleteRequestedBuddiesInfo(String? selfGoalId, String? goalId) async {
    try {
      return _firestore
          .collection(FirebaseConst.goals)
          .doc(goalId)
          .collection(FirebaseConst.requestedBuddies)
          .doc(selfGoalId)
          .delete();
    } catch (e) {
      if (kDebugMode) {
        print('DbController5 deleteRequestedBuddiesInfo Error == $e');
      }
    }
  }

  deletePendingRequests(String? selfGoalId, String? goalId) async {
    try {
      return _firestore
          .collection(FirebaseConst.goals)
          .doc(selfGoalId)
          .collection(FirebaseConst.pendingRequests)
          .doc(goalId)
          .delete();
    } catch (e) {
      if (kDebugMode) {
        print('DbController5 deletePendingRequests Error == $e');
      }
    }
  }
}
