import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';

class WebDeviceCard extends StatelessWidget {
  final String deviceName;
  final RxBool isOn;
  final String icon;
  final VoidCallback onTap;
  const WebDeviceCard(
      {super.key,
      required this.deviceName,
      required this.icon,
      required this.onTap,
      required this.isOn});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(
                  () => SvgPicture.asset(
                    icon,
                    width: 50,
                    color: isOn.value
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Obx(
                  () => Text(
                    deviceName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isOn.value
                              ? Theme.of(context).colorScheme.onBackground
                              : Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                        ),
                  ),
                )
              ],
            ),
            // SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(isOn.value ? "on" : "off",
                      style: Theme.of(context).textTheme.labelLarge),
                ),
                SizedBox(width: 10),
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
            )
          ],
        ),
      ),
    );
  }
}
