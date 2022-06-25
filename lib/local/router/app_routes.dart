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
      name: '/Signin',
      page: () => const SigninPage(),
      transition: Transition.zoom,
      binding: SigninBinding()),
  PRegistry(
      name: '/Forgot',
      page: () => const ForgotPage(),
      transition: Transition.zoom,
      binding: ForgotBinding()),
  PRegistry(
      name: '/Poll',
      page: () => PollPage(),
      transition: Transition.zoom,
      binding: PollBinding()),
];
