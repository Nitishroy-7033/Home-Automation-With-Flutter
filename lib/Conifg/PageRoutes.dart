import 'package:get/get.dart';
import 'package:smart_home/Pages/Mobile/HomePage/HomePage.dart';
import 'package:smart_home/Views/Auth/AuthView.dart';
import 'package:smart_home/Views/Home/HomeView.dart';
import 'package:smart_home/Views/Welcome/WelcomeView.dart';

var pages = [
  GetPage(
    name: "/",
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
