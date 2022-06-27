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
                      return Text(wsChannel.value);
                    }),
                    StreamBuilder(
                      stream: channel.stream,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child:
                              Text(snapshot.hasData ? '${snapshot.data}' : 'nnnn'),
                        );
                      },
                    ),
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
