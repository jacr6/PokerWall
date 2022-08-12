import 'package:flutter/material.dart';
import 'package:hnog_pokerwall/main.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class WallPage extends GetView<WallController> {
  WallPage({Key? key}) : super(key: key) {
    channel = WebSocketChannel.connect(
      Uri.parse(websocketserver),
    );
    listenChannel(channel);
  }
  late WebSocketChannel channel;

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
                                Manos(card: "Escalera_Real", value: real.value),
                                Manos(
                                    card: "Escalera_Color", value: color.value),
                                Manos(card: "Poker", value: poker.value),
                                Manos(card: "Full_House", value: full.value),
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
        // floatingActionButton: ElevatedButton(
        //   child: Text("Back"),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
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
    this.card = "Poker",
    this.value = 0,
  }) : super(key: key);
  final card;
  final value;
  @override
  Widget build(BuildContext context) {
    var size = 0.15;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: [
          Image.asset(
            "assets/images/Cantos/$card.png",
            width: Get.width * size,
            height: Get.height * size,
          ),
          Text("  $value%",
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
