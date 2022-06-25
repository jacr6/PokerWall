import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';
import 'index.dart';

class SelectFormPage extends GetView<StatelessWidget> {
  SelectFormPage({
    Key? key,
    this.ctrl,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final SelectController? ctrl;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Image.asset("assets/images/1x/logo.png"),
            Wrap(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/Admin");
                    },
                    child: Text("Admin")),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/Wall");
                    },
                    child: Text("Wall"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
