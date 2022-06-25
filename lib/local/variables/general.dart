import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../index.dart';

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
