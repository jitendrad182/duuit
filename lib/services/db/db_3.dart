import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duuit/const/firebase_const.dart';
import 'package:duuit/controllers/add_goal_controller.dart';
import 'package:duuit/views/dialogs/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DbController3 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final AddGoalController _addGoalController = Get.find();
  late String docId;

  saveUserGoalInfo() async {
    User? user = _auth.currentUser;
    return _firestore
        .collection(FirebaseConst.goals)
        .add(
          {
            FirebaseConst.userId: user!.uid,
            FirebaseConst.goalCategoryName:
                _addGoalController.goalCategoryName(),
            FirebaseConst.goalDescription: _addGoalController.goalDescription(),
            FirebaseConst.weekDuration: _addGoalController.weekDuration(),
            FirebaseConst.successDay: _addGoalController.successDay(),
            FirebaseConst.creationTime: DateTime.now(),
          },
        )
        .then((value) => docId = value.id)
        .catchError(
          (error) {
            Dialogs.defaultDialog1();
          },
        );
  }
}
