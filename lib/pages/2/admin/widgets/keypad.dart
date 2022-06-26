import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:js' as js;
import '../../../../index.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({Key? key}) : super(key: key);

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
                countDownController.pause();
              } else {
                countDownController.resume();
              }

              isRunning.value = !isRunning.value;
            },
            child: Text(isRunning.value ? 'Pause' : 'Start'),
          ),
          ElevatedButton(
            onPressed: () {
              countDownController.restart(
                  duration: duration.value.inSeconds, initialPosition: 0);
              countDownController.pause();
              log("AQUI");
              isRunning.value = false;
            },
            child: Text('Reset'),
          ),
          ElevatedButton(
            onPressed: () {
              // js.context
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
