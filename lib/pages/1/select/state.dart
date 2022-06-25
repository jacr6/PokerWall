import 'package:get/get.dart';

class SelectState extends GetXState {
  String email = '';
  // title
  final _title = "Select".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
}
