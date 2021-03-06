import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';
import 'index.dart';

import 'customformlabel.dart';

class CustomKeypadWidget extends StatelessWidget {
  const CustomKeypadWidget({
    Key? key,
    required this.width,
    this.onNext,
    this.onPrevious,
    this.prevlabel = "Previous",
    this.nextlabel = "Next",
    this.nextFontWeight = FontWeight.normal,
    this.prevFontWeight = FontWeight.normal,
  }) : super(key: key);
  final double width;
  final String nextlabel;
  final String prevlabel;
  final FontWeight nextFontWeight;
  final FontWeight prevFontWeight;
  final onNext;
  final onPrevious;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPrevious,
          child: CustomFormLabelWidget(
              label: prevlabel, fontWeight: prevFontWeight),
        ),
        SizedBox(width: Get.width * width),
        GestureDetector(
          onTap: onNext,
          child: CustomFormLabelWidget(
              label: nextlabel, fontWeight: nextFontWeight),
        ),
      ],
    );
  }
}
