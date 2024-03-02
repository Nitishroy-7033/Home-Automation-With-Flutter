import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../Mobile/Rooms/Widgets/RoomStaticsCard.dart';

class RoomStatics extends StatelessWidget {
  const RoomStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text("Room Statics",
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            SizedBox(height: 10),
            RoomStaticsCard(
              isWeb: true,
              title: "Temprature",
              value: '23',
              icon: Icons.health_and_safety_sharp,
            ),
            SizedBox(height: 10),
            RoomStaticsCard(
              isWeb: true,
              title: "Humidity",
              value: '45',
              icon: Icons.water,
            ),
            SizedBox(height: 10),
            RoomStaticsCard(
              isWeb: true,
              title: "Wind speed",
              value: '23',
              icon: Icons.wind_power,
            ),
            SizedBox(height: 10),
            RoomStaticsCard(
              isWeb: true,
              title: "Wind speed",
              value: '23',
              icon: Icons.ac_unit,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
