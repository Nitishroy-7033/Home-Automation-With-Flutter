import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Controller/ProfileController.dart';
import 'package:smart_home/Pages/Mobile/HomePage/HomePage.dart';
import 'package:smart_home/Pages/Web/HomePage/HomePage.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return const ResponsiveLayout(
      mobile: MobileHomePage(),
      desktop: WebHomePage(),
    );
  }
}
