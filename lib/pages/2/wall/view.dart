import 'package:flutter/material.dart';
import '../../../index.dart';
import 'index.dart';

import 'package:get/get.dart';
import 'widgets/index.dart';

class WallPage extends GetView<WallController> {
  const WallPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext _context) {
    return ContentLayoutWidget(
        background: "assets/images/1x/resume.png",
        child: Stack(
          children: [Text("Wall")],
        ),
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
