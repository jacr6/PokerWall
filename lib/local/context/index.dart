import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../index.dart';

class LocalContext extends Context {
  var channel = WebSocketChannel.connect(
    Uri.parse("ws://localhost:5000/echo"),
  );

  LocalContext() {
    loadConfig("config");
    var websocket = globalConfig["websocket"] ?? "localhost";
    var port = globalConfig["port"] ?? 5000;
    channel = WebSocketChannel.connect(
      Uri.parse("ws://$websocket:$port/echo"),
    );
  }

  RxMap<String, dynamic> memory = {
    "header": {},
    "questions": {},
  }.obs;
}
