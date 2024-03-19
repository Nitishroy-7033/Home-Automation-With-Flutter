import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class WebWelcomePage extends StatelessWidget {
  const WebWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          ElevatedButton.icon(
            onPressed: () {
              Get.offAllNamed("/auth");
            },
            icon: Icon(Icons.security),
            label: Text("GO TO LOGIN PAGE"),
          ),
        ],
      ),
    );
  }
}
