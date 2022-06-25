import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import '../../../index.dart';
import 'index.dart';

import 'package:get/get.dart';
import 'widgets/index.dart';

class AdminPage extends GetView<AdminController> {
  AdminPage({Key? key}) : super(key: key);

  final _controller = CountDownController();
  Widget _buildView(BuildContext context) {
    return ContentLayoutWidget(
        background: "assets/images/1x/fondo.jpg",
        child: Obx(() {
          return Stack(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  Image.asset(
                    "assets/images/1x/logo.png",
                    width: 200,
                    height: 200,
                  ),
                  Wrap(
                    children: [
                      CustomFormTextInput(
                          width: 0.1,
                          label: "Acumulado: ",
                          initialValue: 0,
                          onFieldSubmitted: (value) {}),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CountDownProgressIndicator(
                          autostart: false,
                          controller: _controller,
                          valueColor: Colors.red,
                          backgroundColor: Colors.blue,
                          initialPosition: 0,
                          duration: 360,
                          timeFormatter: (seconds) {
                            return Duration(seconds: seconds)
                                .toString()
                                .split('.')[0]
                                .padLeft(8, '0');
                          },
                          text: 'hh:mm:ss',
                          onComplete: () => null,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (isRunning.value) {
                            _controller.pause();
                          } else {
                            _controller.resume();
                          }

                          isRunning.value = !isRunning.value;
                        },
                        child: Text(isRunning.value ? 'Pause' : 'Resume'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.restart(
                              duration: 360, initialPosition: 0);
                          isRunning.value = !isRunning.value;
                        },
                        child: Text(isRunning.value ? 'Reset' : 'Start'),
                      )
                    ],
                  ),
                ],
              ))
            ],
          );
        }),
        text: '');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 2,
            child: _buildView(context)),
      ),
    );
  }
}

class CustomFormTextInput extends StatelessWidget {
  const CustomFormTextInput(
      {Key? key,
      this.width = 0.1,
      this.label = "",
      this.initialValue = "",
      this.onFieldSubmitted})
      : super(key: key);
  final width;
  final label;
  final initialValue;
  final onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(label,
            style:
                KTextSytle(color: Colors.white, context: context).getStyle()),
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * width,
          child: TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            initialValue: initialValue.toString(),
            cursorColor: Colors.black54,
            style: KTextSytle(
                    context: context,
                    fontSize: 12,
                    fontWeight: FontWeight.normal)
                .getStyle(),
            decoration: InputDecoration.collapsed(
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: "Acumulado",
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: (MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height) *
                    isMobile,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
