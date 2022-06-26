// ignore_for_file: prefer_function_declarations_over_variables, import_of_legacy_library_into_null_safe
import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; 
import 'package:sweetalert/sweetalert.dart';
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

/// ## loadDummyData
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

/// ## loadDummyData
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
            width: MediaQuery.of(context).size.width * width,
            height: MediaQuery.of(context).size.height * height,
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
