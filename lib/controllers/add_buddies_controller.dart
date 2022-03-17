import 'package:duuit/const/image_const.dart';
import 'package:duuit/controllers/find_buddies_controller.dart';
import 'package:duuit/models/add_buddies_model.dart';
import 'package:duuit/services/db_1.dart';
import 'package:get/get.dart';

class AddBuddiesController extends GetxController {
  final RxList<AddBuddiesModel> addBuddiesModel = <AddBuddiesModel>[].obs;

  final RxList<bool> expandedVal = <bool>[].obs;

  final FindBuddiesController _findBuddiesController = Get.find();

  addBuddies(int index) async {
    addBuddiesModel.add(AddBuddiesModel(
      goalId: _findBuddiesController.goalId(index),
      goalCategoryName: _findBuddiesController.goalCategoryName(index),
      weekDuration: _findBuddiesController.weekDuration(index),
      avatar: _findBuddiesController.findGoalModel2[index].avatar,
      userName: _findBuddiesController.findGoalModel2[index].userName,
      userDescription:
          _findBuddiesController.findGoalModel2[index].userDescription,
    ));
    expandedVal.add(false);
  }

  saveBuddies(DbController4 dbController4) async {
    for (int i = 0; i < addBuddiesModel.length; i++) {
      await DbController5().saveRequestBuddiesInfo(
          dbController4.goalModel[0].goalId, addBuddiesModel[i].goalId);
      await DbController5().savePendingRequests(
          dbController4.goalModel[0].goalId, addBuddiesModel[i].goalId);
    }
  }

  removeBuddies(int index) async {
    addBuddiesModel.removeWhere(
        (element) => element.goalId == _findBuddiesController.goalId(index));
    expandedVal.removeRange(0, 1);
  }

  updateExpandedVal(int index) {
    if (expandedVal[index]) {
      expandedVal[index] = false;
    } else {
      expandedVal[index] = true;
    }
  }

  goalCategoryName(int index) {
    return addBuddiesModel[index].goalCategoryName;
  }

  weekDuration(int index) {
    return addBuddiesModel[index].weekDuration;
  }

  avatar(int index) {
    return ImageConst.avatar(addBuddiesModel[index].avatar);
  }

  userName(int index) {
    return addBuddiesModel[index].userName;
  }

  userDescription(int index) {
    return addBuddiesModel[index].userDescription;
  }
}
