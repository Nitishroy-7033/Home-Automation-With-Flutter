import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/ToastMessages.dart';
import 'package:smart_home/Devices/Ac/AcDevice.dart';
import 'package:smart_home/Devices/CommingSoon/DeviceCommingShoon.dart';
import 'package:smart_home/Devices/Fan/FanDevice.dart';
import 'package:smart_home/Devices/LedBulb/LebBulb.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Models/RoomModel.dart';

import '../Models/DeviceModel.dart';

class RoomController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  RxList<RoomModel> rooms = <RoomModel>[].obs;
  Rx<RoomModel> selectedRoom = RoomModel().obs;

  void onInit() async {
    super.onInit();
    await getRooms();
    if (rooms.isNotEmpty) {
      selectedRoom.value = rooms.first;
    }
  }

  Future<void> addRoom(String roomName, String icon) async {
    isLoading.value = true;
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    if (icon.isEmpty) {
      errorMessage("Please select an icon");
    } else {
      var newRoom = RoomModel(
        id: id,
        roomName: roomName,
        icon: icon,
      );
      try {
        await db
            .collection("users")
            .doc(auth.currentUser!.uid)
            .collection("rooms")
            .doc(id)
            .set(
              newRoom.toJson(),
            );
        successMessage("Room added ✅");
        getRooms();
        Get.back();
      } catch (ex) {
        errorMessage(ex.toString());
      }
    }

    isLoading.value = false;
  }

  // Stream<List<RoomModel>> getRooms() {
  //   return db
  //       .collection("users")
  //       .doc(auth.currentUser!.uid)
  //       .collection("rooms")
  //       .snapshots()
  //       .map(
  //         (snap) => snap.docs
  //             .map(
  //               (doc) => RoomModel.fromJson(doc.data()),
  //             )
  //             .toList(),
  //       );
  // }

  Future<void> getRooms() async {
    isLoading.value = true;
    try {
      var snap = await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("rooms")
          .get();
      rooms.clear();
      rooms.value = snap.docs
          .map(
            (doc) => RoomModel.fromJson(doc.data()),
          )
          .toList();
    } catch (ex) {
      errorMessage(ex.toString());
    }
    isLoading.value = false;
  }

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

  Stream<List<RoomModel>> getStreamRooms() {
    return db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("rooms")
        .snapshots()
        .map(
          (snap) => snap.docs
              .map(
                (doc) => RoomModel.fromJson(doc.data()),
              )
              .toList(),
        );
  }
}
