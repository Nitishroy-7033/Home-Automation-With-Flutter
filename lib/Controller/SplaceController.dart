import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    handleStartUpLogic();
  }

  Future<void> handleStartUpLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    if (auth.currentUser != null) {
      Get.offAllNamed("/home");
    } else {
      Get.offAllNamed("/welcome");
    }
  }
}
