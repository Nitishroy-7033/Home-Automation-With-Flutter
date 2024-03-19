import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Models/UserMode.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Rx<UserModel> user = UserModel().obs;

  void onInit() {
    getUserDetails();
    super.onInit();
  }

  Future<void> getUserDetails() async {
    isLoading.value = true;
    await db.collection("users").doc(auth.currentUser!.uid).get().then(
      (value) {
        user.value = UserModel.fromJson(value.data()!);
      },
    );
    isLoading.value = true;
  }
}
