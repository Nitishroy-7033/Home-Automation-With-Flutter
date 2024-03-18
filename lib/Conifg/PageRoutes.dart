import 'package:get/get.dart';
import 'package:smart_home/Views/Auth/AuthView.dart';
import 'package:smart_home/Views/Home/HomeView.dart';
import 'package:smart_home/Views/Splace/Splace.dart';
import 'package:smart_home/Views/Welcome/WelcomeView.dart';

var pages = [
  GetPage(
    name: "/",
    page: () => const SplaceView(),
  ),
  GetPage(
    name: "/home",
    page: () => const HomeView(),
  ),
  GetPage(
    name: "/auth",
    page: () => const AuthView(),
  ),
  GetPage(
    name: "/welcome",
    page: () => const WelcomeView(),
  ),
];
