import 'package:get/get.dart';
import 'package:hnog_pokerwall/pages/index.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = routes.map((i) => GetPage(
      name: i.name,
      page: i.page,
      transition: i.transition,
      binding: i.binding));
}
