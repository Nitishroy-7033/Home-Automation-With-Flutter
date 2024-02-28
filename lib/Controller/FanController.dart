import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  RxDouble fanSpeed = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void changeSpeed(double value) {
    int speed = fanSpeed.value.toInt();
    animationController.duration = Duration(seconds: max(1, speed));
    animationController.repeat();
  }
}
