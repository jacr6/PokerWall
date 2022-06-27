// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:math';

import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../../index.dart';
import 'package:flutter/foundation.dart';
import 'package:process_run/shell.dart';

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
              isRunning.value = !isRunning.value;
            },
            child: Text(isRunning.value ? 'Pause' : 'Start'),
          ),
          ElevatedButton(
            onPressed: () {
              isRunning.value = false;
            },
            child: Text('Reset'),
          ),
          ElevatedButton(
            onPressed: () {
              if (kIsWeb) {
                // running on the web!
              } else {
                var randPort = Random().nextInt(65534);
                var shell = Shell();
                var shell2 = Shell();
                try {
                  shell.run(
                      "python3 -m http.server --directory build/web $randPort");
                } catch (e) {
                  log(e);
                } finally {
                  shell2.run(" chromium http://localhost:$randPort/#/Wall");
                }
              }

              isRunning.value = true;
            },
            child: Text('Show Window'),
          )
        ],
      );
    });
  }
}
