import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/BottomButton.dart';
import 'package:smart_home/Components/LedBulb/LebBulb.dart';
import 'package:smart_home/Pages/Mobile/Rooms/Widgets/DeviceCard.dart';
import 'package:smart_home/Pages/Mobile/Rooms/Widgets/RoomStaticsCard.dart';

class MobileRoomPage extends StatelessWidget {
  const MobileRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;
    return Scaffold(
      floatingActionButton: Bottombutton(
        btnName: "Add device",
        icon: Icons.devices_other,
        onTap: () {
          print("Add device");
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
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                DeviceCard(
                  deviceName: "Bulb",
                  icon: Icons.light,
                  onTap: () {
                    Get.to(LedBulb());
                  },
                  isOn: isOn,
                ),
                DeviceCard(
                  deviceName: "Fan",
                  icon: Icons.mode_fan_off,
                  onTap: () {},
                  isOn: isOn,
                ),
                DeviceCard(
                  deviceName: "Speaker",
                  icon: Icons.speaker,
                  onTap: () {},
                  isOn: isOn,
                ),
                DeviceCard(
                  deviceName: "Door",
                  icon: Icons.door_front_door,
                  onTap: () {},
                  isOn: isOn,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
