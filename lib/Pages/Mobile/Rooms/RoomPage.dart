import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/AddDevice.dart/AddDevice.dart';
import 'package:smart_home/Components/BottomButton.dart';
import 'package:smart_home/Devices/Fan/FanDevice.dart';
import 'package:smart_home/Devices/LedBulb/LebBulb.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Controller/RoomController.dart';
import 'package:smart_home/Pages/Mobile/Rooms/Widgets/DeviceCard.dart';
import 'package:smart_home/Pages/Mobile/Rooms/Widgets/RoomStaticsCard.dart';

import '../../../Models/DeviceModel.dart';
import '../../../Models/RoomModel.dart';

class MobileRoomPage extends StatelessWidget {
  final RoomModel room;
  const MobileRoomPage({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;
    RoomController roomController = Get.put(RoomController());
    return Scaffold(
      floatingActionButton: Bottombutton(
        btnName: "Add device",
        icon: Icons.devices_other,
        onTap: () {
          AddDevice(context);
        },
      ),
      appBar: AppBar(
        title: Text('Living Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Room statics",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoomStaticsCard(
                  title: "Humidity",
                  value: room.humidity ?? "0",
                  icon: Icons.ac_unit,
                ),
                RoomStaticsCard(
                  title: "Temprature",
                  value: room.temperature ?? "0",
                  icon: Icons.ac_unit,
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoomStaticsCard(
                  title: "Temprature",
                  value: "23",
                  icon: Icons.ac_unit,
                ),
                RoomStaticsCard(
                  title: "Temprature",
                  value: "23",
                  icon: Icons.ac_unit,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Devices",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Expanded(
            //   child: devices.length > 0
            //       ? GridView.count(
            //           crossAxisCount: 2,
            //           mainAxisSpacing: 10,
            //           crossAxisSpacing: 10,
            //           children: devices
            //               .map(
            //                 (e) => DeviceCard(
            //                   deviceName: e.deviceName!,
            //                   icon: e.icon!,
            //                   onTap: () {
            //                     roomController.deviceRouteMange(e);
            //                   },
            //                   isOn: isOn,
            //                 ),
            //               )
            //               .toList(),
            //         )
            //       : Center(
            //           child: Text(
            //             "No devices",
            //             style: TextStyle(
            //               fontSize: 15,
            //               color:
            //                   Theme.of(context).colorScheme.onPrimaryContainer,
            //             ),
            //           ),
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}
