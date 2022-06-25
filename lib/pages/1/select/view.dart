import 'package:flutter/material.dart';
import '../../../index.dart';
import 'index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class SelectPage extends GetView<SelectController> {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSelectFormPage(context),
    );
  }
}

GetBuilder<SelectController> _buildSelectFormPage(
  BuildContext context,
) {
  return GetBuilder<SelectController>(
    id: 'Select_form_page',
    builder: (controller) => ContentLayoutWidget(
        background: "assets/images/1x/home.png",
        child: SelectFormPage(ctrl: controller),
        text: ''),
  );
}
