// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import '../index.dart';
import 'package:get/get.dart';
import 'package:naver_epv_tat/index.dart';
import 'index.dart';

class PollWidget extends GetView<PollController> {
  PollWidget({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    updateData();

    return SingleChildScrollView(
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.2),
          child: Image.asset("assets/images/1x/icon.png"),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.4,
              left: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              SingleChildScrollView(
                  child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomTitleWidget(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          label: "Evaluación de Punto de Venta",
                        ),
                        CustomTitleWidget(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          label: formattedDate,
                        ),
                        CustomFormDropDownFieldWidget(
                            fontSize: 40,
                            width: 0.50,
                            label: "Cliente  ",
                            value: "0",
                            data: clientes,
                            onSaved: (value) {
                              currentCustomer.value = getCatalogDescription(
                                  findCatalog("CLIENTE"), value);
                              setFormValue(globalctx.memory, "header",
                                  "customer_id", value);
                            },
                            onChanged: (value) {
                              currentCustomer.value = getCatalogDescription(
                                  findCatalog("CLIENTE"), value);
                              setFormValue(globalctx.memory, "header",
                                  "customer_id", value);
                              canales.value = findCatalog("CANAL")
                                  .where((element) =>
                                      element["relation"]["customer"] ==
                                      currentCustomer.value.toString())
                                  .toList();
                            }),
                        Obx(() => CustomFormDropDownFieldWidget(
                            fontSize: 40,
                            width: 0.50,
                            label: "Canal  ",
                            value: "0",
                            data: canales.value
                                .where((element) =>
                                    element["relation"]["customer"] ==
                                    currentCustomer.value.toString())
                                .toList(),
                            onSaved: (value) {
                              currentChannel.value = getCatalogDescription(
                                  findCatalog("CANAL"), value);
                              setFormValue(globalctx.memory, "header",
                                  "channel_id", value);
                            },
                            onChanged: (value) {
                              currentChannel.value = getCatalogDescription(
                                  findCatalog("CANAL"), value);
                              setFormValue(globalctx.memory, "header",
                                  "channel_id", value);
                            })),
                      ],
                    ),
                    Column(children: seccionWidgets),
                    RoundedFormButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      label: "Enviar",
                      height: 0.1,
                      fontSize: 20,
                      onPressed: () async {
                        validateToSend(context);
                      },
                    ),
                  ],
                ),
              )),
            ],
          ),
        )
      ]),
    );
  }
}
