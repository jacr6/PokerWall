

import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';
import 'index.dart';

class Parameters extends StatelessWidget {
  const Parameters({
    Key? key,
    required CountDownController controller,
  })  : _controller = controller,
        super(key: key);

  final CountDownController _controller;

  @override
  Widget build(BuildContext context) {
    var cartas = <Widget>[];

    for (var i = 0; i < 5; i++) {
      cartas.add(
        CustomFormDropDownFieldWidget(
            width: 0.2,
            fontSize: 16,
            hintText: "CARTA ${i + 1}",
            data: [
              {"code": 1, "description": "PICA AS"},
              {"code": 2, "description": "PICA 2"},
              {"code": 3, "description": "PICA 3"},
              {"code": 4, "description": "PICA 4"},
              {"code": 5, "description": "PICA 5"},
              {"code": 6, "description": "PICA 6"},
              {"code": 7, "description": "PICA 7"},
              {"code": 8, "description": "PICA 8"},
              {"code": 9, "description": "PICA 9"},
              {"code": 10, "description": "PICA 10"},
              {"code": 11, "description": "CORAZON AS"},
              {"code": 12, "description": "CORAZON 2"},
              {"code": 13, "description": "CORAZON 3"},
              {"code": 14, "description": "CORAZON 4"},
              {"code": 15, "description": "CORAZON 5"},
              {"code": 16, "description": "CORAZON 6"},
              {"code": 17, "description": "CORAZON 7"},
              {"code": 18, "description": "CORAZON 8"},
              {"code": 19, "description": "CORAZON 9"},
              {"code": 20, "description": "CORAZON 10"},
              {"code": 21, "description": "TREBOL AS"},
              {"code": 22, "description": "TREBOL 2"},
              {"code": 23, "description": "TREBOL 3"},
              {"code": 24, "description": "TREBOL 4"},
              {"code": 25, "description": "TREBOL 5"},
              {"code": 26, "description": "TREBOL 6"},
              {"code": 27, "description": "TREBOL 7"},
              {"code": 28, "description": "TREBOL 8"},
              {"code": 29, "description": "TREBOL 9"},
              {"code": 30, "description": "TREBOL 10"},
              {"code": 31, "description": "DIAMANTE AS"},
              {"code": 32, "description": "DIAMANTE 2"},
              {"code": 33, "description": "DIAMANTE 3"},
              {"code": 34, "description": "DIAMANTE 4"},
              {"code": 35, "description": "DIAMANTE 5"},
              {"code": 36, "description": "DIAMANTE 6"},
              {"code": 37, "description": "DIAMANTE 7"},
              {"code": 38, "description": "DIAMANTE 8"},
              {"code": 39, "description": "DIAMANTE 9"},
              {"code": 40, "description": "DIAMANTE 10"},
              {"code": 41, "description": "PICA J"},
              {"code": 42, "description": "PICA Q"},
              {"code": 43, "description": "PICA K"},
              {"code": 44, "description": "CORAZON J"},
              {"code": 45, "description": "CORAZON Q"},
              {"code": 46, "description": "CORAZON K"},
              {"code": 47, "description": "TREBOL J"},
              {"code": 48, "description": "TREBOL Q"},
              {"code": 49, "description": "TREBOL K"},
              {"code": 50, "description": "DIAMANTE J"},
              {"code": 51, "description": "DIAMANTE Q"},
              {"code": 52, "description": "DIAMANTE K"},
            ],
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