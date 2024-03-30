import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/AddRoom/AddRoom.dart';
import 'package:smart_home/Components/BottomButton.dart';
import 'package:smart_home/Controller/ProfileController.dart';
import 'package:smart_home/Controller/RoomController.dart';
import 'package:smart_home/Pages/Mobile/HomePage/Widgets/AppBar.dart';
import 'package:smart_home/Pages/Mobile/HomePage/Widgets/RoomCard.dart';
import 'package:smart_home/Views/Room/RoomView.dart';

import '../../../Models/RoomModel.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.put(RoomController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      floatingActionButton: Bottombutton(
        btnName: "Add room",
        icon: Icons.add,
        onTap: () {
          print("Add room");
          AddRoom(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(height: 20),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "Hello, ${profileController.user.value.name ?? ".."} ⭐",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: StreamBuilder<List<RoomModel>>(
                  stream: roomController.getStreamRooms(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      List<RoomModel> rooms = snapshot.data ?? [];
                      return GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: rooms
                            .map(
                              (e) => RoomCard(
                                roomName: e.roomName!,
                                deviceCount: "4",
                                icon: e.icon!,
                                onTap: () {
                                  Get.to(
                                    RoomView(
                                      room: e,
                                    ),
                                  );
                                },
                              ),
                            )
                            .toList(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
