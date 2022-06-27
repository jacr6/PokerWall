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
            fontSize: 5,
            hintText: "CARTA ${i + 1}",
            data: cardsCatalog,
            onSaved: (value) {},
            onChanged: (value) {}),
      );
    }

    return Wrap(
      children: [
        CustomFormTextInput(
            fontSize: 5,
            width: 0.2,
            label: "Acumulado: ",
            initialValue: acumulado.value,
            onChange: (value) {
              acumulado.value = value;
            }),
        CustomFormTextInput(
            fontSize: 5,
            width: 0.2,
            label: "Mensaje: ",
            initialValue: mensaje.value,
            onChange: (value) {
              mensaje.value = value;
            }),
        CustomFormTextInput(
            fontSize: 5,
            width: 0.2,
            label: "Tiempo: ",
            initialValue: duration.value.inMinutes,
            onChange: (value) {
              duration.value = Duration(minutes: int.parse(value.toString()));
            }),
        Row(
          children: [
            CustomFormDropDownFieldWidget(
                fontSize: 5,
                hintText: "MESA",
                data: mesaCatalog,
                onSaved: (value) {
                  mesa.value = mesaCatalog
                      .firstWhere((element) =>
                          element["code"].toString() ==
                          value!.toString())["description"]
                      .toString();
                },
                onChanged: (value) {
                  mesa.value = mesaCatalog
                      .firstWhere((element) =>
                          element["code"].toString() ==
                          value!.toString())["description"]
                      .toString();
                }),
            CustomFormDropDownFieldWidget(
                fontSize: 5,
                hintText: "SILLA",
                data: sillaCatalog,
                onSaved: (value) {
                  silla.value = sillaCatalog
                      .firstWhere((element) =>
                          element["code"].toString() ==
                          value!.toString())["description"]
                      .toString();
                },
                onChanged: (value) {
                  silla.value = sillaCatalog
                      .firstWhere((element) =>
                          element["code"].toString() ==
                          value!.toString())["description"]
                      .toString();
                }),
            CustomFormDropDownFieldWidget(
                fontSize: 5,
                hintText: "TIPO DE MANO",
                data: manoCatalog,
                onSaved: (value) {
                  mano.value = manoCatalog
                      .firstWhere((element) =>
                          element["code"].toString() ==
                          value!.toString())["description"]
                      .toString();
                },
                onChanged: (value) {
                  mano.value = manoCatalog
                      .firstWhere((element) =>
                          element["code"].toString() ==
                          value!.toString())["description"]
                      .toString();
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
