import 'package:duuit/const/image_const.dart';
import 'package:duuit/models/create_profile_model.dart';
import 'package:duuit/services/auth.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  final Rx<CreateProfileModel> _createProfile = CreateProfileModel(
    avatar: 1,
    userName: 'UserName',
    userDescription: 'User Description.......',
  ).obs;

  final AuthController _authController = Get.find();

  @override
  void onInit() {
    super.onInit();
    _authController.createProfileControllerIsInitialized = true;
  }

  int avatar() {
    return _createProfile.value.avatar;
  }

  String avatarImageConst() {
    return ImageConst.avatar(_createProfile.value.avatar);
  }

  String userName() {
    return _createProfile.value.userName;
  }

  String userDescription() {
    return _createProfile.value.userDescription;
  }

  void updateAvatar(int avatar) {
    _createProfile.update((val) {
      val!.avatar = avatar;
    });
  }

  void updateUserName(String userName) {
    _createProfile.update((val) {
      val!.userName = userName;
    });
  }

  void updateUserDescription(String userDescription) {
    _createProfile.update((val) {
      val!.userDescription = userDescription;
    });
  }
}
