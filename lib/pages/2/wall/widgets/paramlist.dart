
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';
import 'index.dart';

class ParamListWidget extends StatelessWidget {
  const ParamListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                MensajeWidget(label: "JackPot: ", value: acumulado.value),
                MensajeWidget(label: "Mano: ", value: mano.value),
                MensajeWidget(label: "Mesa: ", value: mesa.value),
                MensajeWidget(label: "Silla: ", value: silla.value),
              ],
            ),
          ),
        ],
      );
    });
  }
}
