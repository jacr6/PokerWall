// ignore_for_file: prefer_function_declarations_over_variables, import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../pages/2/wall/widgets/counter.dart';
import '../index.dart';
import 'index.dart';

import 'package:hnog_pokerwall/pages/index.dart';
import 'package:yaml/yaml.dart';

//  ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗
// ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║
// ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║
// ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║
// ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
//  ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

// ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
// ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
// █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
// ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
// ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
// ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

/// ## loadServer
/// *__Method to set data to context__*
///
///### Uses:
/// ```dart
///   if (res['state'] == true) {
///    setContext("catalogs", res['data']);
///  }
/// ```
setContext(key, value) {
  globalctx.set_context(key, value);
  log(globalctx.context.value);
}

/// ## loadServer
/// *__Method to get data from context__*
///
///### Uses:
/// ```dart
///  var catalogs = getContext("catalogs");
/// ```
getContext(key) {
  return globalctx.get_context(key);
}

/// ## showCustomDialog
/// *__Method to show Custom diaglog__*
///
///### Uses:
/// ```dart
///      showCustomDialog(context, NetRatePage(), "Close",
///                    buttonColor: Colors.white, width: 1.0);
/// ```
/// ### Returns:
///```dart
/// void
///```
void showCustomDialog(context, Widget child, String button,
    {Widget? customChild,
    Color backgroundColor = Colors.black54,
    Color buttonColor = Colors.black54,
    double width = 0.5,
    double height = 0.75,
    onSaved}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        backgroundColor: backgroundColor,
        content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            width: Get.width * width,
            height: Get.height * height,
            child: child),
        actions: <Widget>[
          Row(
            children: [
              customChild ?? Spacer(),
              TextButton(
                child: Text(button,
                    style: KTextSytle(
                            context: context,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: buttonColor)
                        .getStyle()),
                onPressed: () {
                  if (onSaved != null) {
                    onSaved();
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}

/// ## log
/// *__Method print log messages__*
///
///### Uses:
/// ```dart
///     log(e);
/// ```
/// ### Returns:
///```dart
/// void
///```
void log(e) {
  print(e);
}

checkMarkComplete(String code) {
  var sectionCode = code.split("-")[0];
  var markCode = code.split("-")[1];
  return Rx(Icon(Icons.close, color: Colors.red)).value;
}

getQuestionData(id) {
  return preguntas.firstWhere((element) => element["code"] == id);
}

validateRequired() {
  List questions = globalctx.memory["questions"].keys.toSet().toList();
  var rule = globalctx.memory["questions"].isNotEmpty;
  var required = preguntas
      .where((element) => element["relation"]["required"] == true)
      .toList()
      .map((e) => e["code"])
      .toList();
  var complete = 0;
  for (var question in questions) {
    if (required.isNotEmpty && (required.contains(question))) {
      complete++;
    }
  }
  rule = rule && (required.length == complete);
  return rule;
}

sendPoll() {
  try {
    var payload = globalctx.memory.value.toString();
    var yaml = loadYaml(payload);
    var data = (yaml.toString());
    log(data);
    sendPollData(data);
    Get.close(1);
    logOut(session["username"]);
  } catch (e) {
    log(e);
  }
}

Future sendPollData(data) async {
  Map res = await fetchHandler(
      kDefaultSchema,
      kDefaultServer,
      kDefaultServerPort,
      kDefaultEditPoll,
      'POST',
      {"state": "new", "data": data});
  if (res['state'] == true) {
    // globalctx.memory.value = {};
  } else {
    log(res["message"]);
  }
}

listenChannel(channel) {
  log("LISTEN CHANNEL");
  channel.stream.listen((datas) {
    updateDatas(datas);
  });
}

listenSocket(socket) {
  log("LISTEN SOCKET");
  socket.onMessage((datas) {
    updateDataValues(datas);
  });
}

updateCounter(data, countDownController) {
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
    duration.value = Duration(hours: 0, minutes: int.parse(newVal.toString()));
    countDownController.value.restart(initialPosition: 0);
    countDownController.value.pause();
    counter.value = Obx(() => Counter(
          controller: countDownController.value,
        ));
  }
}

updateValues(data) {
  if (data.contains(":")) {
    var command = data.toString().split(":")[1];
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
    if (command == "real") {
      real.value = data.toString().split(":")[2];
    }
    if (command == "color") {
      color.value = data.toString().split(":")[2];
    }
    if (command == "full") {
      full.value = data.toString().split(":")[2];
    }
    if (command == "poker") {
      poker.value = data.toString().split(":")[2];
    }
    if (command == "velocidad") {
      velocidad.value = int.parse(data.toString().split(":")[2]);
    }
    if (command == "tamanio") {
      tamanio.value = int.parse(data.toString().split(":")[2]);
    }
  }
}

updateDatas(datas) {
  datas = datas.split("\n");
  for (var data in datas) {
    if (data.toString().contains("command")) {
      updateCounter(data, countDownController);

      updateValues(data);
    }
  }
}

updateDataValues(datas) {
  if (datas != null) {
    datas = datas.split("\n");
    for (var data in datas) {
      if (data.toString().contains("command")) {
        updateValues(data);
      }
    }
  }
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
        // color: Colors.white,
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
  globalctx.channel.sink.add('command:real:${real.value}');
  globalctx.channel.sink.add('command:color:${color.value}');
  globalctx.channel.sink.add('command:full:${full.value}');
  globalctx.channel.sink.add('command:poker:${poker.value}');
  globalctx.channel.sink.add('command:mesa:${mesa.value}');
  globalctx.channel.sink.add('command:silla:${silla.value}');
  globalctx.channel.sink.add('command:acumulado:${acumulado.value}');
  globalctx.channel.sink.add('command:mensaje:${mensaje.value}');
  globalctx.channel.sink.add('command:velocidad:${velocidad.value}');
  globalctx.channel.sink.add('command:tamanio:${tamanio.value}');
  sendCards();
  globalctx.channel.sink.add('command:timer:${duration.value.inMinutes}');
  globalctx.channel.sink.add('command:reset');
}
