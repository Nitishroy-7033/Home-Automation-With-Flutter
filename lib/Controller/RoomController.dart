import 'package:get/get.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Models/RoomModel.dart';

class RoomController extends GetxController {
  RxList<RoomModel> rooms = <RoomModel>[
    RoomModel(
        id: "1",
        roomName: "Living room",
        icon: IconPaths.bed,
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
        id: "2",
        roomName: "Study room",
        icon: IconPaths.bulb,
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
}
