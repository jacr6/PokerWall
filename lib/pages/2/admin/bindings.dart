import 'package:get/get.dart';

import '../../../index.dart';

class AdminBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AdminController>(AdminController());
    Get.put<AdminState>(AdminState());
  }
}
