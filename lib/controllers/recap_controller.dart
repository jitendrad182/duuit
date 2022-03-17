import 'package:duuit/const/image_const.dart';
import 'package:duuit/controllers/create_profile_controller.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/services/db_1.dart';
import 'package:get/get.dart';

class RecapController extends GetxController {
  final AuthController _authController = Get.find();

  bool? dbController2IsInitialized;

  late CreateProfileController _createProfileController;
  late DbController2 _dbController2;

  @override
  void onInit() {
    super.onInit();
    doThis();
  }

  doThis() {
    dbController2IsInitialized = _authController.dbController2IsInitialized;
    if (dbController2IsInitialized == true) {
      _dbController2 = Get.find();
    } else {
      _createProfileController = Get.find();
    }
  }

  avatar() {
    if (dbController2IsInitialized == true) {
      return ImageConst.avatar(_dbController2.userProfileModel[0].avatar);
    } else {
      return _createProfileController.avatarImageConst();
    }
  }

  userName() {
    if (dbController2IsInitialized == true) {
      return _dbController2.userProfileModel[0].userName;
    } else {
      return _createProfileController.userName();
    }
  }

  userDescription() {
    if (dbController2IsInitialized == true) {
      return _dbController2.userProfileModel[0].userDescription;
    } else {
      return _createProfileController.userDescription();
    }
  }
}
