import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';

class WallPage extends GetView<WallController> {
  WallPage({Key? key}) : super(key: key);
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:5000/echo'),
  );

  Widget _buildView(BuildContext context) {
    channel.stream.listen((data) {
      if (data.toString().contains("acumulado")) {
        wsChannel.value = data.toString().split(":")[1];
      }
      if (data.toString().contains("command")) {
        var command = data.toString().split(":")[1];
        if (command == "pause") {
          countDownController.value.pause();
        }
         if (command == "resume") {
          countDownController.value.resume();
        }
      }
    });
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
                      width: Get.width * 0.5,
                      height: Get.height * 0.5,
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text("Acumulado: ",
                                style: KTextSytle(
                                        fontSize: (Get.width / Get.height) *
                                            isMobile *
                                            60,
                                        color: Colors.white,
                                        context: context)
                                    .getStyle()),
                            Text(wsChannel.value,
                                style: KTextSytle(
                                        fontSize: (Get.width / Get.height) *
                                            isMobile *
                                            60,
                                        color: Colors.white,
                                        context: context)
                                    .getStyle()),
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
