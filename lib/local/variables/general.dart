import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../index.dart';
import '../../pages/2/wall/widgets/counter.dart';

var secciones = findCatalog("SECCION");
var marcas = findCatalog("MARCA");
var tipos = findCatalog("TIPO");
var preguntas = findCatalog("PREGUNTA");
var clientes = findCatalog("CLIENTE");
var canales = Rx(findCatalog("CANAL"));
// var clientes = getMemoryCatalogChild("cabine", "value", "days");
var currentCustomer = Rx("");
var currentChannel = Rx("");
var seccionWidgets = <Widget>[];
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
var isRunning = false.obs;
var duration = Rx(Duration(hours: 0, minutes: 10));
var mesa = "".obs;
var silla = "".obs;
var mano = "".obs;
var countDownController = Rx(CountDownController());
var counter = Rx(Obx(() => Counter(
      controller: countDownController.value,
    )));
var acumulado = "0".obs;
var cards = [].obs;
