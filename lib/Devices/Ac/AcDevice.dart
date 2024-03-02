import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home/Components/DeviceStatics/DeviceStatics.dart';
import 'package:smart_home/Components/Timer/TimerTile.dart';
import 'package:smart_home/Controller/FanController.dart';
import 'package:smart_home/Models/DeviceData.dart';

class AcDevice extends StatelessWidget {
  const AcDevice({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;
    RxString onTime = "12:00 AM".obs;
    RxString offTime = "12:00 PM".obs;

    var data = [
      DeviceData(dateTime: DateTime(2024, 2, 1), value: 12),
      DeviceData(dateTime: DateTime(2024, 2, 2), value: 43),
      DeviceData(dateTime: DateTime(2024, 2, 3), value: 54),
      DeviceData(dateTime: DateTime(2024, 2, 4), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 5), value: 50),
      DeviceData(dateTime: DateTime(2024, 2, 6), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 8), value: 34),
    ];

    FanController fanController = Get.put(FanController());
    RxDouble slider = 50.0.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ac'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: 300,
                  angleRange: 180,
                  customWidths: CustomSliderWidths(
                    progressBarWidth: 40,
                    trackWidth: 40,
                    shadowWidth: 40,
                  ),
                  animationEnabled: true,
                ),
                onChange: (double value) {
                  print(value);
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(isOn.value ? "Ac on" : "Ac off",
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  Obx(
                    () => Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Theme.of(context).colorScheme.primary,
                      inactiveTrackColor:
                          Theme.of(context).colorScheme.background,
                      trackOutlineWidth: MaterialStatePropertyAll(0),
                      trackOutlineColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.onSecondary,
                      ),
                      value: isOn.value,
                      onChanged: (value) {
                        isOn.value = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              TimerTile(
                onTime: onTime,
                offTime: offTime,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Statics",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              SizedBox(height: 10),
              DeviceStatics(
                data: data,
                title: "Fan usage",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
