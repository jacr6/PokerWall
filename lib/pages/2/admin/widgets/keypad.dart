// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            child: Text(isRunning.value ? 'Pausar' : 'Reanudar/Comenzar'),
          ),
          ElevatedButton(
            onPressed: () {
              globalctx.channel.sink.add('command:restart');
              isRunning.value = false;
            },
            child: Text('Reiniciar'),
          ),
          ElevatedButton(
            onPressed: () {
              globalctx.channel.sink.add('command:reset');
              isRunning.value = false;
            },
            child: Text('Restablecer'),
          ),
          ElevatedButton(
            onPressed: () {
              sendData();
            },
            child: Text('Actualizar Pantalla'),
          ),
        ],
      );
    });
  }
}
