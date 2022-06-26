import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      child: CountDownProgressIndicator(
        autostart: true,
        controller: countDownController,
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
