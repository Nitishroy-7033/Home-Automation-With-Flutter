import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Controller/AuthController.dart';
import 'package:smart_home/Controller/ProfileController.dart';

class MobileProfilePage extends StatelessWidget {
  const MobileProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController name =
        TextEditingController(text: profileController.user.value.name ?? "");
    TextEditingController email = TextEditingController(
        text: authController.auth.currentUser!.email ?? "");
    TextEditingController phone = TextEditingController(
        text: authController.auth.currentUser!.phoneNumber ?? "");
    TextEditingController uid =
        TextEditingController(text: authController.auth.currentUser!.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(children: [
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        child: Text(
                          "N",
                          style: TextStyle(fontSize: 28),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () => Text(
                          profileController.user.value.name ?? "Root",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                          authController.auth.currentUser!.email ??
                              "XXXXXXX@gmail.com",
                          style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                )
              ]),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Personal information',
                              style: Theme.of(context).textTheme.labelLarge),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextField(
                          controller: name,
                          enabled: isEdit.value,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextField(
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          controller: email,
                          enabled: isEdit.value,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.alternate_email),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextField(
                          controller: name,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          enabled: isEdit.value,
                          decoration: const InputDecoration(
                            hintText: 'Phone',
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextField(
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          controller: uid,
                          enabled: false,
                          decoration: const InputDecoration(
                            hintText: 'User Uiniq Id',
                            prefixIcon: Icon(Icons.key),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          isEdit.value = !isEdit.value;
                        },
                        icon: Icon(Icons.edit),
                        label: Text('Edit'),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    authController.signOut();
                  },
                  icon: Icon(Icons.exit_to_app_sharp),
                  label: Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
