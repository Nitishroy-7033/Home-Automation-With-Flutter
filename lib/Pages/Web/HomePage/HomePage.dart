import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/DeviceStatics/DeviceStatics.dart';
import 'package:smart_home/Pages/Mobile/Rooms/Widgets/RoomStaticsCard.dart';
import 'package:smart_home/Pages/Web/HomePage/Widgets/AppBar.dart';
import 'package:smart_home/Pages/Web/HomePage/Widgets/DeviceArea.dart';
import 'package:smart_home/Pages/Web/HomePage/Widgets/ProfileWidget.dart';
import 'package:smart_home/Pages/Web/HomePage/Widgets/RoomStatics.dart';
import '../../../Components/AddRoom/AddRoom.dart';
import '../../../Components/BottomButton.dart';
import '../../../Models/DeviceData.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;
    var data = [
      DeviceData(dateTime: DateTime(2024, 2, 1), value: 12),
      DeviceData(dateTime: DateTime(2024, 2, 2), value: 43),
      DeviceData(dateTime: DateTime(2024, 2, 3), value: 54),
      DeviceData(dateTime: DateTime(2024, 2, 4), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 5), value: 50),
      DeviceData(dateTime: DateTime(2024, 2, 6), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 8), value: 34),
      DeviceData(dateTime: DateTime(2024, 2, 10), value: 3),
      DeviceData(dateTime: DateTime(2024, 2, 11), value: 10),
      DeviceData(dateTime: DateTime(2024, 2, 15), value: 8),
      DeviceData(dateTime: DateTime(2024, 2, 20), value: 10),
    ];
    var w = MediaQuery.of(context).size.width;
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
                      SizedBox(height: 10),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            RoomStatics(),
                            w > 1300
                                ? const SizedBox(width: 10)
                                : const SizedBox(),
                            w > 1300
                                ? const Expanded(
                                    child: ProfileWidget(),
                                  )
                                : const SizedBox()
                          ],
                        )),
                        SizedBox(height: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Column(
                              children: [
                                DeviceStatics(
                                  data: data,
                                  title: "Power usage",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
