import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/IconSelector/IconSelector.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Conifg/ToastMessages.dart';
import 'package:smart_home/Controller/DeviceController.dart';
import 'package:smart_home/Controller/RoomController.dart';
import 'package:smart_home/Models/DeviceModel.dart';

import '../PrimaryButton.dart';

Future<dynamic> AddDevice(BuildContext context, String roomId) {
  List myIcons = [
    IconPaths.wifi,
    IconPaths.menu,
    IconPaths.home,
    IconPaths.add_image,
    IconPaths.bed,
    IconPaths.bulb,
    IconPaths.device,
    IconPaths.door,
    IconPaths.fan,
    IconPaths.mic,
    IconPaths.password,
    IconPaths.phone,
    IconPaths.sofa,
    IconPaths.speaker,
    IconPaths.tem,
    IconPaths.wifiLock,
  ];
  RxString selectedIcon = "".obs;
  TextEditingController deviceName = TextEditingController();
  RoomController roomController = Get.put(RoomController());
  DeviceController deviceController = Get.put(DeviceController());
  var deviceList = [
    DropdownMenuItem(
      value: "fan",
      child: Row(
        children: [
          SvgPicture.asset(
            IconPaths.fan,
            color: Theme.of(context).colorScheme.onBackground,
            width: 20,
          ),
          SizedBox(width: 20),
          Text("Fan"),
        ],
      ),
    ),
    DropdownMenuItem(
      value: "speaker",
      child: Row(
        children: [
          SvgPicture.asset(
            IconPaths.speaker,
            color: Theme.of(context).colorScheme.onBackground,
            width: 20,
          ),
          SizedBox(width: 20),
          Text("Speaker"),
        ],
      ),
    ),
    DropdownMenuItem(
      value: "light",
      child: Row(
        children: [
          SvgPicture.asset(
            IconPaths.bulb,
            color: Theme.of(context).colorScheme.onBackground,
            width: 20,
          ),
          SizedBox(width: 20),
          Text("Light"),
        ],
      ),
    ),
    // DropdownMenuItem(
    //   value: "door",
    //   child: Row(
    //     children: [
    //       SvgPicture.asset(
    //         IconPaths.door,
    //         color: Theme.of(context).colorScheme.onBackground,
    //         width: 20,
    //       ),
    //       SizedBox(width: 20),
    //       Text("door"),
    //     ],
    //   ),
    // ),
    // DropdownMenuItem(
    //   value: "mic",
    //   child: Row(
    //     children: [
    //       SvgPicture.asset(
    //         IconPaths.mic,
    //         color: Theme.of(context).colorScheme.onBackground,
    //         width: 20,
    //       ),
    //       SizedBox(width: 20),
    //       Text("mic"),
    //     ],
    //   ),
    // ),
  ];
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
                  Text("New Device",
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
                        "Device name",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: deviceName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      hintText: "Fan",
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Device type",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton2(
                        value: deviceController.selectedDeviceValue.value,
                        underline: SizedBox(),
                        items: deviceList,
                        onChanged: (value) {
                          deviceController.selectedDeviceValue.value = value!;
                        },
                      ),
                    ),
                  )
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
                  Obx(
                    () => roomController.isLoading.value == true
                        ? CircularProgressIndicator()
                        : PrimaryButton(
                            color: Theme.of(context).colorScheme.primary,
                            btnName: "Done",
                            icon: Icons.done,
                            ontap: () {
                              if (deviceName.text.isNotEmpty &&
                                  selectedIcon.value.isNotEmpty) {
                                deviceController.addDevice(
                                  roomId,
                                  deviceName.text,
                                  selectedIcon.value,
                                );
                              } else {
                                errorMessage("fill all fields");
                              }
                            },
                          ),
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
