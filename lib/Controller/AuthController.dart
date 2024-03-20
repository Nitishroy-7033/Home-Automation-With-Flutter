import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/ToastMessages.dart';
import 'package:smart_home/Models/UserMode.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Rx<UserModel> user = UserModel().obs;

  Future<void> signUp(String name, String email, String password) async {
    isLoading.value = true;
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        var newUser = UserModel(
          id: value.user!.uid,
          name: name,
          email: email,
          password: password,
        );
        await db.collection("users").doc(value.user!.uid).set(
              newUser.toJson(),
            );
      });
      successMessage("Account Created ❤️ ");
      Get.offAllNamed("/home");
    } catch (e) {
      errorMessage(e.toString());
    }
    isLoading.value = false;
  }

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      successMessage("Login Successfull ❤️ ");
      Get.offAllNamed("/home");
    } catch (e) {
      errorMessage(e.toString());
    }
    isLoading.value = false;
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.offAllNamed("/auth");
  }
}
