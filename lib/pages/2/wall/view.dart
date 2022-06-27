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
  WallPage({Key? key}) : super(key: key) {
    listenChannel(channel);
  }
  final channel = WebSocketChannel.connect(
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
                    Image.asset(
                      "assets/images/1x/logo.png",
                      width: Get.width * 0.10,
                      height: Get.height * 0.10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        children: cardImages.value,
                      ),
                    ),
                    Row(
                      children: [
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

class Prompter extends StatelessWidget {
  const Prompter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
    });
  }
}

class ParamListWidget extends StatelessWidget {
  const ParamListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                MensajeWidget(label: "Acumulado: ", value: acumulado.value),
                MensajeWidget(label: "Mano: ", value: mano.value),
                MensajeWidget(label: "Mesa: ", value: mesa.value),
                MensajeWidget(label: "Silla: ", value: silla.value),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class MensajeWidget extends StatelessWidget {
  const MensajeWidget(
      {Key? key, required this.label, required this.value, this.fontSize = 10})
      : super(key: key);
  final label;
  final value;
  final fontSize;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(label,
            style: KTextSytle(
                    fontSize: (Get.width / Get.height) * isMobile * fontSize,
                    color: Colors.white,
                    context: context)
                .getStyle()),
        Text(value,
            style: KTextSytle(
                    fontSize: (Get.width / Get.height) * isMobile * fontSize,
                    color: Colors.white,
                    context: context)
                .getStyle()),
      ],
    );
  }
}
