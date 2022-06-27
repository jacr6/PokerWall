import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';
import 'index.dart';

class Parameters extends StatelessWidget {
  const Parameters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartas = <Widget>[];

    for (var i = 0; i < 5; i++) {
      cartas.add(
        CustomFormDropDownFieldWidget(
            width: 0.2,
            fontSize: 16,
            hintText: "CARTA ${i + 1}",
            data: cardsCatalog,
            onSaved: (value) {},
            onChanged: (value) {}),
      );
    }

    return Wrap(
      children: [
        CustomFormTextInput(
            fontSize: 16,
            width: 0.2,
            label: "Acumulado: ",
            initialValue: acumulado.value,
            onFieldSubmitted: (value) {
              acumulado.value = value;
            }),
        Row(
          children: [
            CustomFormDropDownFieldWidget(
                fontSize: 16,
                hintText: "MESA",
                data: [
                  {"code": 1, "description": "MESA 1"},
                  {"code": 2, "description": "MESA 2"},
                  {"code": 3, "description": "MESA 3"},
                  {"code": 4, "description": "MESA 4"},
                  {"code": 5, "description": "MESA 5"},
                  {"code": 6, "description": "MESA 6"},
                  {"code": 7, "description": "MESA 7"},
                  {"code": 8, "description": "MESA 8"},
                  {"code": 9, "description": "MESA 9"},
                  {"code": 10, "description": "MESA 10"},
                ],
                onSaved: (value) {
                  mesa.value = value!;
                },
                onChanged: (value) {
                  mesa.value = value!;
                }),
            CustomFormDropDownFieldWidget(
                fontSize: 16,
                hintText: "SILLA",
                data: [
                  {"code": 1, "description": "SILLA 1"},
                  {"code": 2, "description": "SILLA 2"},
                  {"code": 3, "description": "SILLA 3"},
                  {"code": 4, "description": "SILLA 4"},
                  {"code": 5, "description": "SILLA 5"},
                  {"code": 6, "description": "SILLA 6"},
                  {"code": 7, "description": "SILLA 7"},
                  {"code": 8, "description": "SILLA 8"},
                  {"code": 9, "description": "SILLA 9"},
                  {"code": 10, "description": "SILLA 10"},
                ],
                onSaved: (value) {
                  silla.value = value!;
                },
                onChanged: (value) {
                  silla.value = value!;
                }),
            CustomFormDropDownFieldWidget(
                fontSize: 16,
                hintText: "TIPO DE MANO",
                data: [
                  {"code": 1, "description": "MANO 1"},
                  {"code": 2, "description": "MANO 2"},
                  {"code": 3, "description": "MANO 3"},
                ],
                onSaved: (value) {
                  mano.value = value!;
                },
                onChanged: (value) {
                  mano.value = value!;
                }),
          ],
        ),
        Row(
          children: cartas,
        ),
      ],
    );
  }
}
