import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MobileWelcomePage extends StatelessWidget {
  const MobileWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton.icon(
        onPressed: () {
          Get.offAllNamed("/auth");
        },
        icon: Icon(Icons.golf_course),
        label: Text('GO TO LOGIN'),
      )),
    );
  }
}
