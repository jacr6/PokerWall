import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          timeTextStyle: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          initialPosition: 0,
          duration: duration.value.inSeconds,
          timeFormatter: (seconds) {
            return Duration(seconds: seconds)
                .toString()
                .split('.')[0]
                .padLeft(8, '0');
          },
          text: '',
          onComplete: () => {
            showDialog(
                context: context,
                builder: (BuildContext _) {
                  return Text("Se acabò el tiempo",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ));
                })
          },
        );
      }),
    );
  }
}
