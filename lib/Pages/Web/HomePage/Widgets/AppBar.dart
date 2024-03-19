import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Controller/ProfileController.dart';

import '../../../../Conifg/AssestPaths.dart';

class WebAppbar extends StatelessWidget {
  const WebAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton2(
              // alignment: Alignment.bottomLeft,

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
              items: [
                DropdownMenuItem(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconPaths.bed,
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 20,
                      ),
                      SizedBox(width: 20),
                      Text("Living Room"),
                    ],
                  ),
                  value: "livingRoom",
                ),
                DropdownMenuItem(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconPaths.bulb,
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 20,
                      ),
                      SizedBox(width: 20),
                      Text("Study Rooms"),
                    ],
                  ),
                  value: "studyRoom",
                ),
                DropdownMenuItem(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconPaths.home,
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 20,
                      ),
                      SizedBox(width: 20),
                      Text("Bed Room"),
                    ],
                  ),
                  value: "bedRoom",
                ),
              ],
              onChanged: (value) {},
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
