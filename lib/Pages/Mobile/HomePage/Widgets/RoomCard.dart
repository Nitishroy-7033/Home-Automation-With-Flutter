import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoomCard extends StatelessWidget {
  final String roomName;
  final String deviceCount;
  final String icon;
  final VoidCallback onTap;
  const RoomCard(
      {super.key,
      required this.roomName,
      required this.deviceCount,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        // height: 180,
        // width: 160,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: SvgPicture.asset(
                    icon,
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  roomName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "$deviceCount Devices",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
