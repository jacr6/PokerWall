import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';

class CustomFormTextInput extends StatelessWidget {
  const CustomFormTextInput(
      {Key? key,
      this.fontSize = 10,
      this.width = 0.1,
      this.label = "",
      this.initialValue = "",
      this.onFieldSubmitted})
      : super(key: key);
  final width;
  final label;
  final initialValue;
  final onFieldSubmitted;
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
        Container(
          color: Colors.white,
          width: Get.width * width,
          child: TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            initialValue: initialValue.toString(),
            cursorColor: Colors.black54,
            style: KTextSytle(
                    context: context,
                    fontSize: Get.width / Get.height * isMobile * fontSize,
                    fontWeight: FontWeight.normal)
                .getStyle(),
            decoration: InputDecoration.collapsed(
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: "Acumulado",
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: (Get.width / Get.height) * isMobile * fontSize,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
