import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class WallPage extends GetView<WallController> {
  WallPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    final channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:5000/echo'),
    );
    channel.stream.listen((data) {
      if (data.toString().contains("acumulado")) {
        acumulado.value = data.toString().split(":")[1];
      }
      if (data.toString().contains("command")) {
        var command = data.toString().split(":")[1];
        if (command == "pause") {
          countDownController.value.pause();
        }
        if (command == "resume") {
          countDownController.value.resume();
        }
        if (command == "restart") {
          countDownController.value.restart(initialPosition: 0);
        }
        if (command == "reset") {
          countDownController.value.restart(initialPosition: 0);
          countDownController.value.pause();
        }
        if (command == "cards") {
          var newCards = data.toString().split(":")[2].toString().split(",");
          cards.value = newCards;
          updateCards();
        }
      }
    });
    updateCards();
    return ContentLayoutWidget(
        background: "assets/images/1x/fondo.jpg",
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(child: Obx(() {
                return Column(
                  children: [
                    Image.asset(
                      "assets/images/1x/logo.png",
                      width: Get.width * 0.20,
                      height: Get.height * 0.20,
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.175),
                              child: Row(
                                children: cardImages.value,
                              ),
                            ),
                            Wrap(
                              children: [
                                Text("Acumulado: ",
                                    style: KTextSytle(
                                            fontSize: (Get.width / Get.height) *
                                                isMobile *
                                                10,
                                            color: Colors.white,
                                            context: context)
                                        .getStyle()),
                                Text(acumulado.value,
                                    style: KTextSytle(
                                            fontSize: (Get.width / Get.height) *
                                                isMobile *
                                                10,
                                            color: Colors.white,
                                            context: context)
                                        .getStyle()),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                    counter.value,
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
