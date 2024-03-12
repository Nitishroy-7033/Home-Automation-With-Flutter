import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:smart_home/Components/DeviceStatics/DeviceStatics.dart';
import 'package:smart_home/Components/Timer/TimerTile.dart';
import 'package:smart_home/Controller/FanController.dart';
import 'package:smart_home/Models/DeviceData.dart';

class WaterTankiDevice extends StatelessWidget {
  const WaterTankiDevice({super.key});

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
        title: Text('Water Tanki'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              LiquidCircularProgressIndicator(
                value: 0.25,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                backgroundColor: Colors.blue[
                    50], // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.blue,
                borderWidth: 5.0,
                direction: Axis.vertical,
                center: Text("Loading..."),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(isOn.value ? "Water on" : "Water off",
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
