import 'package:get/get.dart';

class AppSizes {
  static late double height10, width10;

  static mediaQueryHeightWidth() {
    height10 = Get.mediaQuery.size.height * 0.0118;
    width10 = Get.mediaQuery.size.width * 0.0118 * 2.1;
  }
}
