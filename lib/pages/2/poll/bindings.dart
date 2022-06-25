import 'package:get/get.dart';

import 'controller.dart';

class PollBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PollController>(() => PollController());
  }
}
