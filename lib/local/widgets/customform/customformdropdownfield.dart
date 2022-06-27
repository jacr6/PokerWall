import 'package:flutter/material.dart';
import '../index.dart';
import 'index.dart';

// ignore: must_be_immutable
class CustomFormDropDownFieldWidget extends StatelessWidget {
  CustomFormDropDownFieldWidget(
      {Key? key,
      this.disabled = false,
      required this.data,
      this.label = '',
      this.hintText,
      this.width = 0.2,
      this.height = 0.07,
      this.value = "0",
      required this.onSaved,
      required this.onChanged,
      this.validator,
      this.fontSize = 10})
      : super(key: key);

  final String label;
  final String? hintText;
  final double width;
  final double height;
  List<Map<String, dynamic>> data;
  void Function(String?) onSaved;
  void Function(String?) onChanged;
  final String value;
  final bool disabled;
  final String? Function(String?)? validator;
  final fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: [
          CustomFormLabelWidget(
              label: label, fontWeight: FontWeight.normal, fontSize: fontSize),
          if (data.isNotEmpty)
            RoundedFormDropdown(
                fontSize: int.parse(fontSize.toString()),
                onChanged: onChanged,
                width: width,
                height: height,
                data: data,
                hintText: hintText,
                label: label,
                onSaved: onSaved,
                value: value,
                disabled: disabled,
                validator: validator)
        ],
      ),
    );
  }
}
