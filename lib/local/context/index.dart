import 'package:get/get.dart';

import '../../index.dart';

class LocalContext extends Context {
  RxMap<String, dynamic> memory = {
    "header": {},
    "questions": {},
  }.obs;
}
