import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../index.dart';

class LocalContext extends Context {
  var channel = WebSocketChannel.connect(
    Uri.parse("ws://localhost:5000/echo"),
  );

 
  RxMap<String, dynamic> memory = {
    "header": {},
    "questions": {},
  }.obs;
}
