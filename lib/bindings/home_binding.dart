import 'package:duuit/services/db_1.dart';
import 'package:get/get.dart';

//TODO:
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DbController2());
    Get.lazyPut(() => DbController4());
  }
}
//TODO:
