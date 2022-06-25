// ignore_for_file: must_be_immutable

import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class CheckboxField extends StatelessWidget {
  CheckboxField({
    Key? key,
    this.fontWeight = FontWeight.normal,
    required this.label,
    this.color = Colors.black,
    this.trueIconColor = Colors.grey,
    this.initialValue,
    this.enabled = true,
    this.iconSize = 32,
    this.fontSize = 32,
    required this.onSaved,
    required this.onChanged,
  }) : super(key: key);
  FontWeight fontWeight;
  final String label;
  final Color color;
  final MaterialColor trueIconColor;
  final initialValue;
  final bool enabled;
  final double iconSize;
  final double fontSize;
  final onSaved;
  final onChanged;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      dragStartBehavior: DragStartBehavior.down,
      child: Row(
        children: [
          CustomTitleWidget(
              fontSize: fontSize,
              fontWeight: fontWeight,
              label: label,
              color: color),
          CheckboxIconFormField(
            context: context,
            trueIconColor: trueIconColor,
            initialValue: initialValue,
            enabled: enabled,
            iconSize: iconSize,
            onSaved: onSaved,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
