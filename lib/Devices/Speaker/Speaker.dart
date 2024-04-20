import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/DeviceStatics/DeviceStatics.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Controller/DeviceController.dart';
import 'package:smart_home/Models/DeviceData.dart';
import 'package:smart_home/Models/DeviceModel.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Components/Timer/TimerTile.dart';

class SpeakerDevice extends StatelessWidget {
  final String deviceId;
  final String roomId;
  const SpeakerDevice({
    super.key,
    required this.deviceId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    RxString onTime = "12:00 AM".obs;
    RxString offTime = "12:00 PM".obs;

    DeviceController deviceController = Get.put(DeviceController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Speaker"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: deviceController.getDeviceDetailsById(roomId, deviceId),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              DeviceModel deviceDetails = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          IconPaths.speaker,
                          width: 250,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(deviceDetails.isOn! ? "Speaker on" : "Speaker off",
                            style: Theme.of(context).textTheme.labelLarge),
                        Switch(
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveThumbColor:
                              Theme.of(context).colorScheme.primary,
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.background,
                          trackOutlineWidth: MaterialStatePropertyAll(0),
                          trackOutlineColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onSecondary,
                          ),
                          value: deviceDetails.isOn!,
                          onChanged: (value) {
                            deviceController.deviceOnOff(
                              roomId,
                              deviceId,
                              value,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    deviceDetails.isTimerSet!
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
                    const SizedBox(height: 10),
                    DeviceStatics(
                      data: deviceDetails.statics!,
                      title: "Speaker usage",
                    ),
                  ],
                ),
              );
            } else {
              return const Text("No data");
            }
          }),
        ),
      ),
    );
  }
}
