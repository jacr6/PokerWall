
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';

class MensajeWidget extends StatelessWidget {
  const MensajeWidget(
      {Key? key, required this.label, required this.value, this.fontSize = 10})
      : super(key: key);
  final label;
  final value;
  final fontSize;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(label,
            style: KTextSytle(
                    fontSize: (Get.width / Get.height) * isMobile * fontSize,
                    color: Colors.white,
                    context: context)
                .getStyle()),
        Text(value,
            style: KTextSytle(
                    fontSize: (Get.width / Get.height) * isMobile * fontSize,
                    color: Colors.white,
                    context: context)
                .getStyle()),
      ],
    );
  }
}
