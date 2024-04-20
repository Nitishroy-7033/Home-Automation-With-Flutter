import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_home/Models/DeviceModel.dart';

import '../Models/DeviceData.dart';

class DeviceController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxString selectedDeviceValue = 'fan'.obs;
  Future<void> addDevice(
      String roomId, String deviceName, String iconPath) async {
    var deviceType = selectedDeviceValue.value;
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    var newDevice = DeviceModel();
    if (deviceType == 'light') {
      newDevice = DeviceModel(
        id: id,
        deviceName: deviceName,
        roomId: roomId,
        type: deviceType,
        deviceColor: "red",
        timeUsage: '0',
        isOn: false,
        isTimerSet: false,
        onTime: "",
        offTime: "",
        energyRate: "2",
        createdAt: DateTime.now().toString(),
        createdBy: auth.currentUser!.uid,
        icon: iconPath,
      );
    } else if (deviceType == "fan") {
      newDevice = DeviceModel(
        id: id,
        deviceName: deviceName,
        roomId: roomId,
        type: deviceType,
        timeUsage: '0',
        isOn: false,
        isTimerSet: false,
        onTime: "",
        offTime: "",
        energyRate: "2",
        createdAt: DateTime.now().toString(),
        createdBy: auth.currentUser!.uid,
        deviceSpeed: "0",
        icon: iconPath,
        energyUsage: "0",
      );
    } else if (deviceType == "door") {
      newDevice = DeviceModel(
        id: id,
        deviceName: deviceName,
        roomId: roomId,
        type: deviceType,
        timeUsage: '0',
        isOn: false,
        isTimerSet: false,
        onTime: "",
        offTime: "",
        energyRate: "2",
        createdAt: DateTime.now().toString(),
        createdBy: auth.currentUser!.uid,
        icon: iconPath,
      );
    } else if (deviceType == "speaker") {
      newDevice = DeviceModel(
        id: id,
        deviceName: deviceName,
        roomId: roomId,
        type: deviceType,
        timeUsage: '0',
        isOn: false,
        isTimerSet: false,
        onTime: "",
        offTime: "",
        energyRate: "2",
        createdAt: DateTime.now().toString(),
        createdBy: auth.currentUser!.uid,
        icon: iconPath,
      );
    } else if (deviceType == "light") {
      newDevice = DeviceModel(
        id: id,
        deviceName: deviceName,
        roomId: roomId,
        type: deviceType,
        timeUsage: '0',
        isOn: false,
        isTimerSet: false,
        onTime: "",
        offTime: "",
        energyRate: "2",
        createdAt: DateTime.now().toString(),
        createdBy: auth.currentUser!.uid,
        icon: iconPath,
      );
    } else if (deviceType == "") {
      newDevice = DeviceModel(
        id: id,
        deviceName: deviceName,
        roomId: roomId,
        type: deviceType,
        timeUsage: '0',
        isOn: false,
        isTimerSet: false,
        onTime: "",
        offTime: "",
        energyRate: "2",
        createdAt: DateTime.now().toString(),
        createdBy: auth.currentUser!.uid,
        icon: iconPath,
      );
    }

    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("rooms")
          .doc(roomId)
          .collection("devices")
          .doc(id)
          .set(
            newDevice.toJson(),
          );
      Get.back();
    } catch (ex) {
      print(ex.toString());
    }
  }

  Stream<List<DeviceModel>> getDevices(String roomid) {
    return db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("rooms")
        .doc(roomid)
        .collection("devices")
        .snapshots()
        .map(
          (snap) => snap.docs
              .map(
                (doc) => DeviceModel.fromJson(doc.data()),
              )
              .toList(),
        );
  }

  Stream<DeviceModel> getDeviceDetailsById(String roomId, String deviceId) {
    return db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("rooms")
        .doc(roomId)
        .collection("devices")
        .doc(deviceId)
        .snapshots()
        .map((snapshot) {
      return DeviceModel.fromJson(snapshot.data()!);
    });
  }

  Future<void> deviceOnOff(String roomId, String deviceId, bool isOn) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("rooms")
        .doc(roomId)
        .collection("devices")
        .doc(deviceId)
        .update({
      "isOn": isOn,
    });
  }
}
