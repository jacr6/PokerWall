import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../index.dart';
import '../../pages/2/wall/widgets/counter.dart';

var secciones = findCatalog("SECCION");
var marcas = findCatalog("MARCA");
var tipos = findCatalog("TIPO");
var preguntas = findCatalog("PREGUNTA");
var clientes = findCatalog("CLIENTE");
var canales = Rx(findCatalog("CANAL"));
// var clientes = getMemoryCatalogChild("cabine", "value", "days");
var currentCustomer = Rx("");
var currentChannel = Rx("");
var seccionWidgets = <Widget>[];
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
var isRunning = false.obs;
var duration = Rx(Duration(hours: 0, minutes: 10));
var mesa = "".obs;
var silla = "".obs;
var mano = "".obs;
var countDownController = Rx(CountDownController());
var counter = Rx(Obx(() => Counter(
      controller: countDownController.value,
    )));
var acumulado = "0".obs;
var mensaje = "...".obs;
var cards = [53, 53, 53, 53, 53].obs;
var cardImages = Rx(<Widget>[]);
var manoCatalog = [
  {"code": 1, "description": "MANO 1"},
  {"code": 2, "description": "MANO 2"},
  {"code": 3, "description": "MANO 3"},
];
var sillaCatalog = [
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
];
var mesaCatalog = [
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
];
var cardsCatalog = [
  {"code": 1, "description": "Pica_1"},
  {"code": 2, "description": "Pica_2"},
  {"code": 3, "description": "Pica_3"},
  {"code": 4, "description": "Pica_4"},
  {"code": 5, "description": "Pica_5"},
  {"code": 6, "description": "Pica_6"},
  {"code": 7, "description": "Pica_7"},
  {"code": 8, "description": "Pica_8"},
  {"code": 9, "description": "Pica_9"},
  {"code": 10, "description": "Pica_10"},
  {"code": 11, "description": "Corazon_1"},
  {"code": 12, "description": "Corazon_2"},
  {"code": 13, "description": "Corazon_3"},
  {"code": 14, "description": "Corazon_4"},
  {"code": 15, "description": "Corazon_5"},
  {"code": 16, "description": "Corazon_6"},
  {"code": 17, "description": "Corazon_7"},
  {"code": 18, "description": "Corazon_8"},
  {"code": 19, "description": "Corazon_9"},
  {"code": 20, "description": "Corazon_10"},
  {"code": 21, "description": "Trebol_1"},
  {"code": 22, "description": "Trebol_2"},
  {"code": 23, "description": "Trebol_3"},
  {"code": 24, "description": "Trebol_4"},
  {"code": 25, "description": "Trebol_5"},
  {"code": 26, "description": "Trebol_6"},
  {"code": 27, "description": "Trebol_7"},
  {"code": 28, "description": "Trebol_8"},
  {"code": 29, "description": "Trebol_9"},
  {"code": 30, "description": "Trebol_10"},
  {"code": 31, "description": "Diamante_1"},
  {"code": 32, "description": "Diamante_2"},
  {"code": 33, "description": "Diamante_3"},
  {"code": 34, "description": "Diamante_4"},
  {"code": 35, "description": "Diamante_5"},
  {"code": 36, "description": "Diamante_6"},
  {"code": 37, "description": "Diamante_7"},
  {"code": 38, "description": "Diamante_8"},
  {"code": 39, "description": "Diamante_9"},
  {"code": 40, "description": "Diamante_10"},
  {"code": 41, "description": "Pica_11"},
  {"code": 42, "description": "Pica_12"},
  {"code": 43, "description": "Pica_13"},
  {"code": 44, "description": "Corazon_11"},
  {"code": 45, "description": "Corazon_12"},
  {"code": 46, "description": "Corazon_13"},
  {"code": 47, "description": "Trebol_11"},
  {"code": 48, "description": "Trebol_12"},
  {"code": 49, "description": "Trebol_13"},
  {"code": 50, "description": "Diamante_11"},
  {"code": 51, "description": "Diamante_12"},
  {"code": 52, "description": "Diamante_13"},
  {"code": 53, "description": "Hidden"},
];

listenChannel(channel) {
  channel.stream.listen((datas) {
    datas = datas.split("\n");
    for (var data in datas) {
      if (data.toString().contains("command")) {
        var command = data.toString().split(":")[1];
        if (command == "pause") {
          countDownController.value.pause();
        }
        if (command == "start") {
          countDownController.value.resume();
        }
        if (command == "restart") {
          countDownController.value.restart(initialPosition: 0);
        }
        if (command == "reset") {
          countDownController.value.restart(initialPosition: 0);
          countDownController.value.pause();
        }
        if (command == "timer") {
          var newVal = data.toString().split(":")[2];
          duration.value =
              Duration(hours: 0, minutes: int.parse(newVal.toString()));
          countDownController.value.restart(initialPosition: 0);
          countDownController.value.pause();
        }
        if (command == "cards") {
          List<int> newData = [];
          var newVal = data.toString().split(":")[2].toString().split(",");
          for (var element in newVal) {
            newData.add(int.parse(element.toString()));
          }
          cards.value = newData;
          updateCards();
        }
        if (command == "mensaje") {
          var newmensaje = data.toString().split(":")[2];
          mensaje.value = newmensaje;
        }
        if (command == "acumulado") {
          acumulado.value = data.toString().split(":")[2];
        }
        if (command == "mesa") {
          mesa.value = data.toString().split(":")[2];
        }
        if (command == "silla") {
          silla.value = data.toString().split(":")[2];
        }
        if (command == "mano") {
          mano.value = data.toString().split(":")[2];
        }
      }
    }
  });
}

updateCards() {
  cardImages.value = <Widget>[];
  for (var i = 0; i < 5; i++) {
    var cardCode = cards.value[i];
    var description = "";
    var cardDescription = cardsCatalog
        .firstWhere((card) => card["code"].toString() == cardCode.toString());
    if (cardDescription == null) {
      description = "Hidden";
    } else {
      description = cardDescription["description"].toString();
    }

    cardImages.value.add(Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        width: Get.width * 0.16,
        height: Get.height * 0.3,
        child: Image.asset(
          "assets/images/cards/$description.png",
          width: Get.width * 0.3,
          height: Get.height * 0.3,
        ),
      ),
    ));
  }
}

sendCards() {
  var value = cards.value.join(",");
  var command = 'command:cards:$value';
  globalctx.channel.sink.add(command);
}

sendData() {
  globalctx.channel.sink.add('command:mano:${mano.value}');
  globalctx.channel.sink.add('command:mesa:${mesa.value}');
  globalctx.channel.sink.add('command:silla:${silla.value}');
  globalctx.channel.sink.add('command:acumulado:${acumulado.value}');
  globalctx.channel.sink.add('command:mensaje:${mensaje.value}');
  sendCards();
  globalctx.channel.sink.add('command:timer:${duration.value.inMinutes}');
  globalctx.channel.sink.add('command:reset');
}
