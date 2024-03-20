import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Controller/ProfileController.dart';
import 'package:smart_home/Controller/RoomController.dart';
import 'package:smart_home/Models/RoomModel.dart';

import '../../../../Components/AddRoom/AddRoom.dart';
import '../../../../Components/BottomButton.dart';
import '../../../../Conifg/AssestPaths.dart';

class WebAppbar extends StatelessWidget {
  const WebAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    RoomController roomController = Get.put(RoomController());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      // height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Obx(
                      () => Text(
                        profileController.user.value.name ?? "..",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              width: 230,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: roomController.rooms.isNotEmpty
                  ? DropdownButton2(
                      underline: SizedBox(),
                      hint: Row(
                        children: [
                          SvgPicture.asset(
                            IconPaths.bed,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          SizedBox(width: 20),
                          Text("Home Page"),
                        ],
                      ),
                      value: roomController.selectedRoom.value.roomName!
                          .toLowerCase(),
                      items: roomController.rooms
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.roomName!.toLowerCase(),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    e.icon ?? IconPaths.bed,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    width: 20,
                                  ),
                                  SizedBox(width: 20),
                                  Text(e.roomName!),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        roomController.selectedRoom.value = roomController.rooms
                            .firstWhere((element) =>
                                element.roomName!.toLowerCase() == value);
                      },
                    )
                  : InkWell(
                      onTap: () {
                        AddRoom(context);
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 10),
                              Text("Add Room"),
                            ],
                          )),
                    ),
            ),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "10:00 AM",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Monday, 20 July",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Icon(
                Icons.watch_later_rounded,
                size: 40,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ],
          )
        ],
      ),
    );
  }
}
