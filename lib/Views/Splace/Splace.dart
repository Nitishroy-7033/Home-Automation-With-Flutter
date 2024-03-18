import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Controller/SplaceController.dart';
import 'package:smart_home/Pages/Mobile/Splace/SplaceScreen.dart';
import 'package:smart_home/Pages/Web/Splace/SplacePage.dart';

class SplaceView extends StatelessWidget {
  const SplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return const ResponsiveLayout(
      mobile: MobileSplacePage(),
      desktop: WebSplacePage(),
    );
  }
}
