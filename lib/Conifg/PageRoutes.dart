import 'package:get/get.dart';
import 'package:smart_home/Pages/Mobile/HomePage/HomePage.dart';
import 'package:smart_home/Views/Auth/AuthView.dart';
import 'package:smart_home/Views/Home/HomeView.dart';

var pages = [
  GetPage(
    name: "/",
    page: () => HomeView(),
  ),
  GetPage(
    name: "/auth",
    page: () => AuthView(),
  ),
];
