import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/DeviceStatics/DeviceStatics.dart';
import 'package:smart_home/Components/Timer/TimerTile.dart';
import 'package:smart_home/Models/DeviceData.dart';
import 'package:smart_home/Models/DeviceModel.dart';

import '../../Controller/DeviceController.dart';

class LedBulb extends StatelessWidget {
  final DeviceModel deviceModel;
  final String roomId;
  const LedBulb({super.key, required this.deviceModel, required this.roomId});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;

    List colors = [
      Colors.white,
      Colors.red,
      Colors.green,
      Colors.blue,
    ];
    RxString onTime = "12:00 AM".obs;
    RxString offTime = "12:00 PM".obs;
    onTime.value = deviceModel.onTime!;
    offTime.value = deviceModel.offTime!;
    RxInt selectedColor = 0.obs;

    var data = [
      DeviceData(dateTime: DateTime(2024, 2, 1), value: 12),
      DeviceData(dateTime: DateTime(2024, 2, 2), value: 43),
      DeviceData(dateTime: DateTime(2024, 2, 3), value: 54),
      DeviceData(dateTime: DateTime(2024, 2, 4), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 5), value: 50),
      DeviceData(dateTime: DateTime(2024, 2, 6), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 8), value: 34),
    ];
    DeviceController deviceController = Get.put(DeviceController());
    return Scaffold(
      appBar: AppBar(
        title: Text(deviceModel.deviceName!),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: StreamBuilder(
              stream: deviceController.getDeviceDetailsById(
                  roomId, deviceModel.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  DeviceModel deviceDetials = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 120),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.light,
                                size: 200,
                                color: colors[selectedColor.value],
                              ),
                            ],
                          ),
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
                                          color: selectedColor.value ==
                                                  colors.indexOf(e)
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .background,
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
                            Text(deviceDetials.isOn! ? "Bulb on" : "Bulb off",
                                style: Theme.of(context).textTheme.labelLarge),
                            Switch(
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              inactiveThumbColor:
                                  Theme.of(context).colorScheme.primary,
                              inactiveTrackColor:
                                  Theme.of(context).colorScheme.background,
                              trackOutlineWidth: MaterialStatePropertyAll(0),
                              trackOutlineColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.onSecondary,
                              ),
                              value: isOn.value,
                              onChanged: (value) {
                                isOn.value = value;
                                deviceController.deviceOnOff(
                                  roomId,
                                  deviceModel.id!,
                                  value,
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        deviceDetials.isTimerSet!
                            ? TimerTile(
                                onTime: onTime,
                                offTime: offTime,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Set Time"),
                                  ),
                                ],
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
                          title: "Bulb usage",
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text("No data");
                }
              })),
    );
  }
}
