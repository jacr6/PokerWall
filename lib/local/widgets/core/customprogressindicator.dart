import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  const CustomProgressIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        width: Get.width * 0.01,
        height: Get.height * 0.01,
        child: CircularProgressIndicator());
  }
}
