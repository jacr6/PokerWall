// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io'
    if (dart.library.html) 'dart:html'
    if (dart.library.js) 'dart:js' as window;
import '../../../../index.dart';

class KeyPad extends StatelessWidget {
  KeyPad({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          ElevatedButton(
            onPressed: () {
              showCustomDialog(
                  context,
                  DurationPicker(
                    duration: duration.value,
                    baseUnit: BaseUnit.minute,
                    onChange: (val) {
                      duration.value = val;
                    },
                    snapToMins: 5.0,
                  ),
                  "Close",
                  buttonColor: Colors.white);
            },
            child: Text("Set Timer"),
          ),
          ElevatedButton(
            onPressed: () {
            
              if (isRunning.value) {
                countDownController.value.pause();
              } else {
                countDownController.value.resume();
              }

              isRunning.value = !isRunning.value;
            },
            child: Text(isRunning.value ? 'Pause' : 'Start'),
          ),
          ElevatedButton(
            onPressed: () {
              countDownController.value.restart(
                  duration: duration.value.inSeconds, initialPosition: 0);
              countDownController.value.pause();
              log("AQUI");
              isRunning.value = false;
            },
            child: Text('Reset'),
          ),
          ElevatedButton(
            onPressed: () {
              // window.context
              //     .callMethod('open', ['/#/Wall', '_blank', 'fullscreen=yes']);
              isRunning.value = true;
            },
            child: Text('Show Window'),
          )
        ],
      );
    });
  }
}
