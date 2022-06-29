import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class WallPage extends GetView<WallController> {
  WallPage({Key? key}) : super(key: key) {
    listenChannel(channel);
    loadConfig("config");
    var websocket = globalConfig["websocket"]??"localhost";
    var port = globalConfig["port"]??5000;
    channel = WebSocketChannel.connect(
      Uri.parse("ws://$websocket:$port/echo"),
    );
  }
  var channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:5000/echo'),
  );
  Widget _buildView(BuildContext context) {
    updateCards();

    return ContentLayoutWidget(
        background: "assets/images/1x/fondo.jpg",
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(child: Obx(() {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        children: cardImages.value,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/1x/logo.png",
                          width: Get.width * 0.40,
                          height: Get.height * 0.40,
                        ),
                        ParamListWidget(),
                        counter.value,
                      ],
                    ),
                    Prompter(),
                  ],
                );
              }))
            ],
          ),
        ),
        text: '');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: SizedBox(
            width: Get.width,
            height: Get.height * 2,
            child: _buildView(context)),
      ),
    );
  }
}
