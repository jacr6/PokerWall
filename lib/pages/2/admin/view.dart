import 'package:flutter/material.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class AdminPage extends GetView<AdminController> {
  const AdminPage({Key? key}) : super(key: key);

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
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  KeyPad(),
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
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 2,
            child: _buildView(context)),
      ),
    );
  }
}
