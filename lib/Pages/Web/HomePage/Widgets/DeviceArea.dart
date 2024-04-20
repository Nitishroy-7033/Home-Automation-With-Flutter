import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Conifg/AssestPaths.dart';
import '../../../Mobile/Rooms/Widgets/DeviceCard.dart';

class DeviceArea extends StatelessWidget {
  const DeviceArea({super.key});

  @override
  Widget build(BuildContext context) {
    bool isOn = true;
    var w = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        height: 450,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Devices",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {
                    print("Add");
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5),
                      Text(
                        "Add",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: w > 1400
                    ? 4
                    : w > 1000
                        ? 3
                        : 2,
                children: [
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                  DeviceCard(
                    deviceName: "Fan",
                    icon: IconPaths.fan,
                    onTap: () {},
                    isOn: isOn,
                    isWeb: true,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
