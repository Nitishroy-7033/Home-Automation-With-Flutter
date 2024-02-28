import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/IconSelector/IconSelector.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';

import '../PrimaryButton.dart';

Future<dynamic> AddRoom(BuildContext context) {
  List myIcons = [
    IconPaths.fan,
    IconPaths.home,
    IconPaths.menu,
    IconPaths.wifi,
  ];
  RxString selectedIcon = "".obs;
  TextEditingController roomName = TextEditingController();
  return Get.bottomSheet(Container(
    height: 400,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Add room",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      MyIconSelector(context, myIcons, selectedIcon);
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.all(20),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: selectedIcon.value == ""
                            ? SvgPicture.asset(
                                IconPaths.home,
                                width: 50,
                              )
                            : SvgPicture.asset(
                                selectedIcon.value,
                                width: 50,
                              ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Roon name",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: roomName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      hintText: "Living Room",
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    color: Theme.of(context).colorScheme.background,
                    btnName: "Close",
                    icon: Icons.close,
                    ontap: () {
                      Get.back();
                    },
                  ),
                  PrimaryButton(
                    color: Theme.of(context).colorScheme.primary,
                    btnName: "Done",
                    icon: Icons.done,
                    ontap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  ));
}
