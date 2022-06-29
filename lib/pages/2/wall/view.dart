import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class WallPage extends GetView<WallController> {
  WallPage({Key? key}) : super(key: key) {
    listenChannel(channel);
    loadConfig("config");
    var websocket = globalConfig["websocket"] ?? "localhost";
    var port = globalConfig["port"] ?? 5000;
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Manos(card: realHand.value, value: real.value),
                                Manos(
                                    card: colorHand.value, value: color.value),
                                Manos(card: fullHand.value, value: full.value),
                                Manos(
                                    card: pokerHand.value, value: poker.value),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              ParamListWidget(),
                              Image.asset(
                                "assets/images/1x/logo.png",
                                width: Get.width * 0.30,
                                height: Get.height * 0.30,
                              ),
                            ],
                          ),
                          counter.value,
                        ],
                      ),
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
        floatingActionButton: ElevatedButton(
          child: Text("Back"),
          onPressed: () {
            Get.back();
          },
        ),
        body: SizedBox(
            width: Get.width,
            height: Get.height * 2,
            child: _buildView(context)),
      ),
    );
  }
}

class Manos extends StatelessWidget {
  const Manos({
    Key? key,
    this.card = const ["Hidden", "Hidden", "Hidden", "Hidden", "Hidden"],
    this.value = 0,
  }) : super(key: key);
  final card;
  final value;
  @override
  Widget build(BuildContext context) {
    var size = 0.07;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Image.asset(
            "assets/images/cards/${card[0]}.png",
            width: Get.width * size,
            height: Get.height * size,
          ),
          Image.asset(
            "assets/images/cards/${card[1]}.png",
            width: Get.width * size,
            height: Get.height * size,
          ),
          Image.asset(
            "assets/images/cards/${card[2]}.png",
            width: Get.width * size,
            height: Get.height * size,
          ),
          Image.asset(
            "assets/images/cards/${card[3]}.png",
            width: Get.width * size,
            height: Get.height * size,
          ),
          Image.asset(
            "assets/images/cards/${card[4]}.png",
            width: Get.width * size,
            height: Get.height * size,
          ),
          Text("$value%",
              style: KTextSytle(
                context: context,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ).getStyle()),
        ],
      ),
    );
  }
}
