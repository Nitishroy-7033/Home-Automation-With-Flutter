import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/DeviceStatics/DeviceStatics.dart';
import 'package:smart_home/Components/Timer/TimerTile.dart';

class LedBulb extends StatelessWidget {
  const LedBulb({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;

    List colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.white,
    ];
    RxString onTime = "12:00 AM".obs;
    RxString offTime = "12:00 PM".obs;
    RxInt selectedColor = 0.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Led Bulb'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.light,
                    size: 200,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Set bulb color",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: colors
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            selectedColor.value = colors.indexOf(e);
                            print(e);
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: e,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selectedColor.value == colors.indexOf(e)
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.background,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(isOn.value ? "Bulb on" : "Bulb off",
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
              DeviceStatics(),
            ],
          ),
        ),
      ),
    );
  }
}
