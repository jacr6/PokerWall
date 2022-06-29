import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        RoundedFormDropdown(
            width: 0.2,
            fontSize: 10,
            hintText: "CARTA ${i + 1}",
            data: cardsCatalog,
            onSaved: (value) {
              cards[i] = int.parse(value.toString());
            },
            onChanged: (value) {
              cards[i] = int.parse(value.toString());
            }),
      );
    }

    return Wrap(
      children: [
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "Velocidad Prompter: ",
            initialValue: velocidad.value,
            onChange: (value) {
              velocidad.value = int.parse(value.toString());
            }),
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "Tamaño Prompter: ",
            initialValue: tamanio.value,
            onChange: (value) {
              tamanio.value = int.parse(value.toString());
            }),
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "JackPot: ",
            initialValue: acumulado.value,
            onChange: (value) {
              acumulado.value = value;
            }),
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "EscaleraReal: ",
            initialValue: real.value,
            onChange: (value) {
              real.value = value;
            }),
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "EscaleraColor: ",
            initialValue: color.value,
            onChange: (value) {
              color.value = value;
            }),
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "FullHouse: ",
            initialValue: full.value,
            onChange: (value) {
              full.value = value;
            }),
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "Poker: ",
            initialValue: poker.value,
            onChange: (value) {
              poker.value = value;
            }),
        CustomFormTextInput(
            fontSize: 10,
            width: 0.2,
            label: "Tiempo: ",
            initialValue: duration.value.inMinutes,
            onChange: (value) {
              value = value ?? 0;
              if (value == "") {
                value = 0;
              }
              duration.value = Duration(minutes: int.parse(value.toString()));
            }),
        CustomFormTextInput(
            maxLines: 1000,
            fontSize: 10,
            width: 0.5,
            height: 0.2,
            label: "Mensajes: ",
            initialValue: mensaje.value,
            onChange: (value) {
              value = value.toString().split("\n").join(" ");
              mensaje.value = value;
            }),
        Row(
          children: [
            RoundedFormDropdown(
                fontSize: 10,
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
            RoundedFormDropdown(
                fontSize: 10,
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
            RoundedFormDropdown(
                fontSize: 10,
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
