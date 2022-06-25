import 'package:get/get.dart';

import 'controller.dart';

class WallBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WallController>(() => WallController());
  }
}
