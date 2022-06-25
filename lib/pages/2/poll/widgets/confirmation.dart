import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../index.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "¿Está seguro de enviar la infromación recopilada?",
          style: KTextSytle(fontSize: 40, color: Colors.white, context: context)
              .getStyle(),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                 sendPoll();
                },
                child: Text(
                  "Enviar",
                  style: KTextSytle(
                          fontSize: 40, color: Colors.white, context: context)
                      .getStyle(),
                  textAlign: TextAlign.center,
                )),
            TextButton(
                onPressed: () {
                  Get.close(1);
                },
                child: Text(
                  "Cancelar",
                  style: KTextSytle(
                          fontSize: 40, color: Colors.white, context: context)
                      .getStyle(),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ],
    );
  }
}
