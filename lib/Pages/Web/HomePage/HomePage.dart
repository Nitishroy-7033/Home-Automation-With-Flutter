import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Pages/Mobile/Rooms/Widgets/DeviceCard.dart';
import 'package:smart_home/Pages/Web/HomePage/Widgets/AppBar.dart';
import 'package:smart_home/Pages/Web/HomePage/Widgets/DeviceArea.dart';

import '../../../Components/AddRoom/AddRoom.dart';
import '../../../Components/BottomButton.dart';
import 'Widgets/DeviceCard.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;
    return Scaffold(
      floatingActionButton: Bottombutton(
        btnName: "Add room",
        icon: Icons.add,
        onTap: () {
          print("Add room");
          AddRoom(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            WebAppbar(),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      DeviceArea(),
                    ],
                  )),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      // color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
