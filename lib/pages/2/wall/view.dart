import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../index.dart';
import 'package:get/get.dart';
import 'widgets/index.dart';
import 'package:text_scroll/text_scroll.dart';

class WallPage extends GetView<WallController> {
  WallPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    final channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:5000/echo'),
    );
    channel.stream.listen((data) {
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
        if (command == "timer") {
          var newVal = data.toString().split(":")[2];
          duration.value = Duration(hours: 0, minutes: int.parse(newVal.toString()));
          countDownController.value.restart(initialPosition: 0);
          countDownController.value.pause();
        }
        if (command == "cards") {
          var newVal = data.toString().split(":")[2].toString().split(",");
          cards.value = newVal;
          updateCards();
        }
        if (command == "mensaje") {
          var newmensaje = data.toString().split(":")[2];
          mensaje.value = newmensaje;
        }
        if (command == "acumulado") {
          acumulado.value = data.toString().split(":")[2];
        }
        if (command == "mano") {
          mano.value = data.toString().split(":")[2];
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
                      width: Get.width * 0.10,
                      height: Get.height * 0.10,
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
                            MensajeWidget(
                                label: "Acumulado: ", value: acumulado.value),
                            MensajeWidget(label: "Mano: ", value: mano.value),
                          ],
                        ),
                      );
                    }),
                    counter.value,
                    Obx(() {
                      return MarqueeText(
                        text: TextSpan(
                          text: mensaje.value,
                        ),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        speed: 20,
                        textDirection: TextDirection.rtl,
                        marqueeDirection: MarqueeDirection.rtl,
                      );
                    }),
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

class MensajeWidget extends StatelessWidget {
  const MensajeWidget({Key? key, required this.label, required this.value})
      : super(key: key);
  final label;
  final value;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(label,
            style: KTextSytle(
                    fontSize: (Get.width / Get.height) * isMobile * 5,
                    color: Colors.white,
                    context: context)
                .getStyle()),
        Text(value,
            style: KTextSytle(
                    fontSize: (Get.width / Get.height) * isMobile * 5,
                    color: Colors.white,
                    context: context)
                .getStyle()),
      ],
    );
  }
}
