import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class Counter extends StatelessWidget {
   Counter({
    Key? key,
    required this.controller
  }) : super(key: key); 
  CountDownController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      child: CountDownProgressIndicator(
        autostart: true,
        controller: controller,
        valueColor: Colors.red,
        backgroundColor: Colors.blue,
        initialPosition: 0,
        duration: duration.value.inSeconds,
        timeFormatter: (seconds) {
          return Duration(seconds: seconds)
              .toString()
              .split('.')[0]
              .padLeft(8, '0');
        },
        text: 'hh:mm:ss',
        onComplete: () => null,
      ),
    );
  }
}
