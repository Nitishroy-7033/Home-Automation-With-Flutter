import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_home/Models/DeviceModel.dart';

class DeviceController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxString selectedDeviceValue = 'fan'.obs;
  Future<void> addDevice(String roomId) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    var newDevice = DeviceModel(
      id: id,
      deviceName: "New Device",
    );
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
}
