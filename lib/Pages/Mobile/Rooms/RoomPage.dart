import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/AddDevice.dart/AddDevice.dart';
import 'package:smart_home/Components/BottomButton.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Controller/DeviceController.dart';
import 'package:smart_home/Controller/RoomController.dart';
import 'package:smart_home/Models/DeviceModel.dart';
import 'package:smart_home/Pages/Mobile/Rooms/Widgets/RoomStaticsCard.dart';
import '../../../Models/RoomModel.dart';
import 'Widgets/DeviceCard.dart';

class MobileRoomPage extends StatelessWidget {
  final RoomModel room;
  const MobileRoomPage({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;
    RoomController roomController = Get.put(RoomController());
    DeviceController deviceController = Get.put(DeviceController());
    return Scaffold(
      floatingActionButton: Bottombutton(
        btnName: "Add device",
        icon: Icons.devices_other,
        onTap: () {
          AddDevice(context, room.id!);
        },
      ),
      appBar: AppBar(
        title: Text('Living Room'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: StreamBuilder(
            stream: deviceController.getDevices(room.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                List<DeviceModel> deviceList = snapshot.data!;
                return Column(
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
                    Expanded(
                        child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: deviceList
                          .map(
                            (e) => DeviceCard(
                              deviceName: e.deviceName ?? "No name",
                              icon: IconPaths.bulb,
                              onTap: () {
                                roomController.deviceRouteMange(e, room.id!);
                              },
                              isOn: e.isOn ?? true,
                              roomId: room.id!,
                              deviceId: e.id ?? "",
                            ),
                          )
                          .toList(),
                    )),
                    const SizedBox(height: 60),
                  ],
                );
              } else {
                return Text("No data");
              }
            },
          )),
    );
  }
}
