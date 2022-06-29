import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';

import '../../../../index.dart';

class Prompter extends StatelessWidget {
  const Prompter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(top: Get.height * 0.0),
        child: MarqueeText(
          text: TextSpan(
            text: mensaje.value,
          ),
          style: TextStyle(
            fontSize: tamanio.value * 1.0,
            color: Colors.white,
          ),
          speed: velocidad.value * 1.0,
          textDirection: TextDirection.rtl,
          marqueeDirection: MarqueeDirection.rtl,
        ),
      );
    });
  }
}
