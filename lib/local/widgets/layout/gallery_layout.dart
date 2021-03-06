import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryLayoutWidget extends StatelessWidget {
  const GalleryLayoutWidget({Key? key, this.child, this.text})
      : super(key: key);
  final dynamic child;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Positioned(
        left: 0,
        child: Image.asset(
          "assets/images/1x/layout.png",
          fit: BoxFit.fill,
          height: Get.height,
          width: Get.width,
        ),
      ),
      child,
      Positioned(
        left: 0,
        child: Image.asset(
          "assets/images/1x/gallery_left.png",
          fit: BoxFit.fitHeight,
          height: Get.height,
        ),
      ),
      Positioned(
        top: Get.height * 0.0045,
        left: Get.width * 0.85,
        child: Image.asset(
          "assets/images/1x/gallery_right.png",
          fit: BoxFit.fitHeight,
          height: Get.height * 0.995,
        ),
      ),
    ]);
  }
}
