// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:math';

import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
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
              globalctx.channel.sink
                  .add('command:${!isRunning.value ? 'pause' : 'start'}');
              isRunning.value = !isRunning.value;
            },
            child: Text(isRunning.value ? 'Pause' : 'Start'),
          ),
          ElevatedButton(
            onPressed: () {
              globalctx.channel.sink.add('command:restart');
              isRunning.value = false;
            },
            child: Text('Restart'),
          ),
          ElevatedButton(
            onPressed: () {
              globalctx.channel.sink.add('command:reset');
              isRunning.value = false;
            },
            child: Text('Reset'),
          ),
          ElevatedButton(
            onPressed: () {
              sendData();
            },
            child: Text('Update Window'),
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
                  globalctx.channel.sink
                      .add('command:timer:${duration.value.inMinutes}');
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
