import 'package:flutter/material.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class AdminPage extends GetView<AdminController> {
  AdminPage({Key? key}) : super(key: key);
  Widget _buildView(BuildContext context) {
    return ContentLayoutWidget(
        background: "assets/images/1x/fondo.jpg",
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  Image.asset(
                    "assets/images/1x/logo.png",
                    width: Get.width * 0.25,
                    height: Get.height * 0.25,
                  ),
                  KeyPad(),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Parameters(),
                ],
              ))
            ],
          ),
        ),
        text: '');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          child: Text("Back"),
          onPressed: () {
            Get.back();
          },
        ),
        body: SizedBox(
            width: Get.width,
            height: Get.height * 2,
            child: _buildView(context)),
      ),
    );
  }
}
