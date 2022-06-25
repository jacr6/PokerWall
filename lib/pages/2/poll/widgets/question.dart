import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget({
    Key? key,
    required this.qCatalog,
  }) : super(key: key);

  final CatalogDto qCatalog;
  var localValue = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => CheckboxField(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        initialValue: localValue.value,
        label: qCatalog.description,
        onSaved: (value) {
          localValue.value = value;
          setFormValue(globalctx.memory, "questions", qCatalog.code,
              value ? qCatalog.value : 0);
        },
        onChanged: (value) {
          localValue.value = value;
          setFormValue(globalctx.memory, "questions", qCatalog.code,
              value ? qCatalog.value : 0);
        }));
  }
}
