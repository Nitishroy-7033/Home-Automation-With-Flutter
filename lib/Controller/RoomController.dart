import 'package:get/get.dart';
import 'package:smart_home/Devices/Ac/AcDevice.dart';
import 'package:smart_home/Devices/CommingSoon/DeviceCommingShoon.dart';
import 'package:smart_home/Devices/Fan/FanDevice.dart';
import 'package:smart_home/Devices/LedBulb/LebBulb.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Models/RoomModel.dart';

import '../Models/DeviceModel.dart';

class RoomController extends GetxController {
  RxList<RoomModel> rooms = <RoomModel>[
    RoomModel(
        id: "1",
        roomName: "Living room",
        icon: IconPaths.bed,
        status: "Active",
        devices: [
          DeviceModel(
            id: "1",
            deviceName: "Light",
            icon: IconPaths.bulb,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            selectedColorIndex: 2,
            temperature: "25",
            humidity: "50",
            onTime: "12:00 AM",
            offTime: "12:00 PM",
            battery: "100",
            type: "light",
            statics: [],
          ),
          DeviceModel(
            id: "2",
            deviceName: "Fan",
            icon: IconPaths.fan,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            temperature: "25",
            humidity: "50",
            battery: "100",
            type: "fan",
            statics: [],
          ),
          DeviceModel(
            id: "3",
            deviceName: "Bed",
            icon: IconPaths.bed,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            temperature: "25",
            humidity: "50",
            battery: "100",
            type: "bed",
            statics: [],
          ),
          DeviceModel(
            id: "4",
            deviceName: "Speaker",
            icon: IconPaths.speaker,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            temperature: "25",
            humidity: "50",
            battery: "100",
            type: "speaker",
            statics: [],
          ),
        ],
        timeUsage: "2h 30m",
        energyUsage: "2.5",
        energyRate: "0.5",
        temperature: "25",
        humidity: "50",
        battery: "100",
        statics: []),
    RoomModel(
        id: "2",
        roomName: "Study room",
        icon: IconPaths.bulb,
        status: "Active",
        devices: [
          DeviceModel(
            id: "1",
            deviceName: "Light",
            icon: IconPaths.bulb,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            temperature: "25",
            humidity: "50",
            battery: "100",
            type: "light",
            statics: [],
          ),
          DeviceModel(
            id: "2",
            deviceName: "Fan",
            icon: IconPaths.fan,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            temperature: "25",
            humidity: "50",
            battery: "100",
            type: "fan",
            statics: [],
          ),
          DeviceModel(
            id: "3",
            deviceName: "Bed",
            icon: IconPaths.bed,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            temperature: "25",
            humidity: "50",
            battery: "100",
            type: "bed",
            statics: [],
          ),
          DeviceModel(
            id: "4",
            deviceName: "Speaker",
            icon: IconPaths.speaker,
            status: "Active",
            timeUsage: "2h 30m",
            energyUsage: "2.5",
            energyRate: "0.5",
            temperature: "25",
            humidity: "50",
            battery: "100",
            type: "speaker",
            statics: [],
          ),
        ],
        timeUsage: "2h 30m",
        energyUsage: "2.5",
        energyRate: "0.5",
        temperature: "25",
        humidity: "50",
        battery: "100",
        statics: []),
    RoomModel(
        id: "3",
        roomName: "Kitchen",
        icon: IconPaths.password,
        status: "Active",
        devices: [],
        timeUsage: "2h 30m",
        energyUsage: "2.5",
        energyRate: "0.5",
        temperature: "25",
        humidity: "50",
        battery: "100",
        statics: []),
    RoomModel(
      id: "4",
      roomName: "Bedroom",
      icon: IconPaths.sofa,
      status: "Active",
      devices: [],
      timeUsage: "2h 30m",
      energyUsage: "2.5",
      energyRate: "0.5",
      temperature: "25",
      humidity: "50",
      battery: "100",
      statics: [],
    ),
  ].obs;

  void deviceRouteMange(DeviceModel device) {
    switch (device.type) {
      case "light":
        Get.to(LedBulb(
          deviceModel: device,
        ));
        break;
      case "fan":
        Get.to(FanDevice());
        break;
      case "bed":
        Get.to(AcDevice());
      default:
        Get.to(DeviceCommingSoon());
    }
  }
}
