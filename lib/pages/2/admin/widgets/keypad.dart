import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;
import '../../../../index.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({
    Key? key,
    required CountDownController controller,
  })  : _controller = controller,
        super(key: key);

  final CountDownController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            showCustomDialog(
                context,
                DurationPicker(
                  duration: duration.value,
                  baseUnit: BaseUnit.minute,
                  onChange: (val) {
                    duration.value = val;
                  },
                  snapToMins: 5.0,
                ),
                "Close",
                buttonColor: Colors.white);
          },
          child: Text("Set Timer"),
        ),
        ElevatedButton(
          onPressed: () {
            if (isRunning.value) {
              _controller.pause();
            } else {
              _controller.resume();
            }

            isRunning.value = !isRunning.value;
          },
          child: Text(isRunning.value ? 'Pause' : 'Start'),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.restart(
                duration: duration.value.inSeconds, initialPosition: 0);
            _controller.pause();

            isRunning.value = false;
          },
          child: Text('Reset'),
        ),
        ElevatedButton(
          onPressed: () {
            js.context.callMethod('open', ['https://google.com/']);
          },
          child: Text('Show Window'),
        )
      ],
    );
  }
}
