import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../index.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer scheduleTimeout([int milliseconds = 3000]) =>
        Timer(Duration(milliseconds: milliseconds), handleTimeout);
    scheduleTimeout();
  }

  void handleTimeout() {
    // callback function
    Get.toNamed("/Select");
    // Do some work.
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: ContentLayoutWidget(
            background: "assets/images/1x/splash.gif", child: Text("")));
  }
}
