import 'package:duuit/controllers/create_profile_controller.dart';
import 'package:duuit/services/auth.dart';
import 'package:duuit/services/db/db_2.dart';
import 'package:get/get.dart';

class RecapController extends GetxController {
  final AuthController _authController = Get.find();

  bool? _isProfileController;

  late CreateProfileController _createProfileController;
  late DbController2 _dbController2;

  @override
  void onInit() {
    super.onInit();
    doThis();
  }

  doThis() {
    _isProfileController = _authController.createProfileControllerIsInitialized;
    if (_isProfileController == true) {
      _createProfileController = Get.find();
    } else {
      _dbController2 = Get.find();
    }
  }

  avatarImageConst() {
    if (_isProfileController == true) {
      return _createProfileController.avatarImageConst();
    } else {
      return _dbController2.avatarImageConst();
    }
  }

  userName() {
    if (_isProfileController == true) {
      return _createProfileController.userName();
    } else {
      return _dbController2.userName();
    }
  }

  userDescription() {
    if (_isProfileController == true) {
      return _createProfileController.userDescription();
    } else {
      return _dbController2.userDescription();
    }
  }
}
