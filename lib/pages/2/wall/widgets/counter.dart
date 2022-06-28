import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweetalert/sweetalert.dart';

import '../../../../index.dart';

class Counter extends StatelessWidget {
  Counter({Key? key, required this.controller}) : super(key: key);
  CountDownController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.5,
      width: Get.width * 0.3,
      child: Obx(() {
        return CountDownProgressIndicator(
          autostart: true,
          controller: controller,
          valueColor: Colors.red,
          backgroundColor: Colors.blue,
          initialPosition: 0,
          duration: duration.value.inSeconds,
          timeTextStyle: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
          timeFormatter: (seconds) {
            return Duration(seconds: seconds)
                .toString()
                .split('.')[0]
                .padLeft(8, '0');
          },
          text: '',
          onComplete: () {
            countDownController.value.restart(initialPosition: 0);
            countDownController.value.pause();
            SweetAlert.show(context,
                curve: ElasticInCurve(),
                title: "Tiempo Fuera",
                style: SweetAlertStyle.error, onPress: (bool isConfirm) {
              Get.close(1);
              return false;
            });
          },
        );
      }),
    );
  }
}
