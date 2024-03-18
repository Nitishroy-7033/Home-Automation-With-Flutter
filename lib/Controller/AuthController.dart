import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_home/Conifg/ToastMessages.dart';
import 'package:smart_home/Models/UserMode.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Future<void> SignUp(String name, String email, String password) async {
    isLoading.value = true;
    try {
      var newUser = UserModel(name: name, email: email, password: password);
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
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

  Future<void> SignIn(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      successMessage("Login Successfull ❤️ ");
    } catch (e) {
      errorMessage(e.toString());
    }
    isLoading.value = false;
  }
}
