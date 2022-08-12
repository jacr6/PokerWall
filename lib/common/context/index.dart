// ignore_for_file: non_constant_identifier_names, prefer_function_declarations_over_variables
import 'package:get/get.dart';

import '../../index.dart';

bool isFirstLaunch = true;
var defaultToken;
LocalContext globalctx = LocalContext();
var session = {};
////
var selectedIndex = 0.obs;
var absorvedPurpose = false.obs;
var pageList = [];
var searcherHeader = Rx([]);
var searcherDetail = Rx([]);
var searchResult = Rx([]);

// ignore: mixin_inherits_from_not_object
class Context {
  void set_context(key, value) {
    context.value[key] = value;
  }

  dynamic get_context(key) {
    return context.value[key];
  }

  Rx<Map<String, dynamic>> context = Rx({
    "index": 0.obs,
    "icons": {}.obs,
    "countries": {},
    "session": {"avatar": ''.obs},
    "catalogs": {}.obs,
    "config":{}
  }.obs);
}
