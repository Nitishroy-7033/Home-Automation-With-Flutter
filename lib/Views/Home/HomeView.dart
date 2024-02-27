import 'package:flutter/material.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Pages/Mobile/HomePage/HomePage.dart';
import 'package:smart_home/Pages/Web/HomePage/HomePage.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileHomePage(),
      desktop: WebHomePage(),
    );
  }
}
