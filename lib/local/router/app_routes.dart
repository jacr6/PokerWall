part of './app_pages.dart';

class PRegistry {
  PRegistry({this.name, this.page, this.transition, this.binding});
  final String? name;
  final dynamic page;
  final dynamic transition;
  final dynamic binding;
}

List<dynamic> routes = [
  PRegistry(
      name: '/Splash',
      page: () => const SplashPage(),
      transition: Transition.zoom,
      binding: SplashBinding()),
  PRegistry(
      name: '/Select',
      page: () => const SelectPage(),
      transition: Transition.zoom,
      binding: SelectBinding()),
  PRegistry(
      name: '/Wall',
      page: () => WallPage(),
      transition: Transition.zoom,
      binding: WallBinding()),
  PRegistry(
      name: '/Admin',
      page: () => AdminPage(),
      transition: Transition.zoom,
      binding: AdminBinding()),
];
