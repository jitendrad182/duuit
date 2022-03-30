import 'package:duuit/const/image_const.dart';
import 'package:duuit/const/string_const.dart';
import 'package:duuit/controllers/find_buddies_controller.dart';
import 'package:duuit/models/add_buddies_model.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/services/db/db_5.dart';
import 'package:duuit/views/dialogs/dialogs.dart';
import 'package:get/get.dart';

class AddBuddiesController extends GetxController {
  final RxList<AddBuddiesModel> _addBuddiesModel = <AddBuddiesModel>[].obs;
  final RxList<bool> _expandedVal = <bool>[].obs;

  final AuthController _authController = Get.find();

  addBuddies(int index, FindBuddiesController _findBuddiesController) async {
    if (_addBuddiesModel.length < 5) {
      _findBuddiesController.updateCheckboxVal(index);
      _addBuddiesModel.add(AddBuddiesModel(
        goalId: _findBuddiesController.goalId(index),
        userId: _findBuddiesController.userId(index),
        goalCategoryName: _findBuddiesController.goalCategoryName(index),
        weekDuration: _findBuddiesController.weekDuration(index),
        avatar: _findBuddiesController.avatar(index),
        userName: _findBuddiesController.userName(index),
        userDescription: _findBuddiesController.userDescription(index),
      ));
      _expandedVal.add(false);
    } else {
      Dialogs.defaultErrorDialog1(StringConst.only5BuddiesError);
    }
  }

  removeBuddies(int index, FindBuddiesController _findBuddiesController) async {
    _findBuddiesController.updateCheckboxVal(index);
    _addBuddiesModel.removeWhere(
        (element) => element.goalId == _findBuddiesController.goalId(index));
    _expandedVal.removeRange(0, 1);
    for (int j = 0; j < _expandedVal.length; j++) {
      _expandedVal[j] = false;
    }
  }

  saveBuddies(String docId) async {
    for (int i = 0; i < _addBuddiesModel.length; i++) {
      if (_authController.userId != _addBuddiesModel[i].userId) {
        await DbController5().saveRequestedBuddiesInfo(
            docId, _addBuddiesModel[i].goalId, _addBuddiesModel[i].userId);
        await DbController5().savePendingRequests(
            docId, _addBuddiesModel[i].goalId, _authController.userId);
      }
    }
  }

  length() {
    return _addBuddiesModel.length;
  }

  isEmpty() {
    return _addBuddiesModel.isEmpty;
  }

  expanded(int index) {
    return _expandedVal[index];
  }

  updateExpandedVal(int index) {
    if (_expandedVal[index]) {
      _expandedVal[index] = false;
    } else {
      _expandedVal[index] = true;
    }
  }

  goalCategoryName(int index) {
    return _addBuddiesModel[index].goalCategoryName;
  }

  weekDuration(int index) {
    return _addBuddiesModel[index].weekDuration;
  }

  avatar(int index) {
    return ImageConst.avatarImageConst(_addBuddiesModel[index].avatar);
  }

  userName(int index) {
    return _addBuddiesModel[index].userName;
  }

  userDescription(int index) {
    return _addBuddiesModel[index].userDescription;
  }
}
