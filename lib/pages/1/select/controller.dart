// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import '../../../index.dart';
import 'index.dart';
import 'package:get/get.dart';

class SelectController extends GetxController {
  SelectController();

  final state = SelectState();
  void getConfirmation(ctx, msg, success) {
    showCustomDialog(ctx, Text("OK"), "Close");
  }

  Future<void> onSelect(ctx, String email) async {
    state.email = email;

    var res = await fetchHandler(kDefaultSchema, kDefaultServer,
        kDefaultServerPort, kDefaultConnectPath, 'POST', {
      "state": "Select",
      "data": {"email": state.email}
    });

    if (res['state']) {
      showCustomDialog(
        ctx,
        Text("A confirmation email was sent !!!!",
            style: KTextSytle(
                    context: ctx,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)
                .getStyle()),
        "Close",
        backgroundColor: Colors.grey,
        buttonColor: Colors.black,
      );
    } else {
      showCustomDialog(
        ctx,
        Text("The system had a technical problem, try again later",
            style: KTextSytle(
                    context: ctx,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)
                .getStyle()),
        "Close",
        backgroundColor: Colors.grey,
        buttonColor: Colors.black,
      );
    }
  }
}
