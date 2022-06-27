import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';

class CustomFormTextInput extends StatelessWidget {
  const CustomFormTextInput(
      {Key? key,
      this.fontSize = 20,
      this.width = 0.1,
      this.height = 0.05,
      this.label = "",
      this.maxLines = 1,
      this.initialValue = "",
      this.onChange})
      : super(key: key);
  final width;
  final height;
  final label;
  final initialValue;
  final onChange;
  final fontSize;
  final maxLines;
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
          height: Get.width * height,
          child: TextFormField(
            maxLines: maxLines,
            onChanged: onChange,
            cursorHeight: Get.width / Get.height * isMobile * fontSize,
            initialValue: initialValue.toString(),
            cursorColor: Colors.black54,
            style: KTextSytle(
                    context: context,
                    fontSize: Get.width / Get.height * isMobile * fontSize,
                    fontWeight: FontWeight.normal)
                .getStyle(),
            decoration: InputDecoration.collapsed(
              fillColor: Colors.white,
              // border: OutlineInputBorder(),
              hintText: "Acumulado",
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: (Get.width / Get.height) * isMobile * fontSize,
                // decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
