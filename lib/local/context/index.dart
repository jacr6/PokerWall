import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../index.dart';
import '../../main.dart';

class LocalContext extends Context {
  late WebSocketChannel channel;
  LocalContext() {
    channel = WebSocketChannel.connect(
      Uri.parse(websocketserver),
    );
  }

  RxMap<String, dynamic> memory = {
    "header": {},
    "questions": {},
  }.obs;
}
