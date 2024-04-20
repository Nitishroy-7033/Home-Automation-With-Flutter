import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Controller/DeviceController.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final bool isOn;
  final String icon;
  final VoidCallback onTap;
  final bool isWeb;
  final String roomId;
  final String deviceId;
  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.icon,
    required this.onTap,
    required this.isOn,
    this.isWeb = false,
    this.roomId = "",
    this.deviceId = "",
  });

  @override
  Widget build(BuildContext context) {
    DeviceController deviceController = Get.put(DeviceController());
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isWeb
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 50,
                  color: isOn
                      ? Theme.of(context).colorScheme.onBackground
                      : Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  deviceName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isOn
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
            // SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isOn ? "on" : "off",
                    style: Theme.of(context).textTheme.labelLarge),
                SizedBox(width: 10),
                Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveThumbColor: Theme.of(context).colorScheme.primary,
                  inactiveTrackColor: Theme.of(context).colorScheme.background,
                  trackOutlineWidth: MaterialStatePropertyAll(0),
                  trackOutlineColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.onSecondary,
                  ),
                  value: isOn,
                  onChanged: (value) {
                    deviceController.deviceOnOff(roomId, deviceId, value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
