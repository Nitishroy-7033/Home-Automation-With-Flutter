import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileProfilePage extends StatelessWidget {
  const MobileProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
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
                        child: Text("N"),
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nitish kumar',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 5),
                      Text('Nitishr8333@gmail.com',
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
                          enabled: isEdit.value,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextField(
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
                          enabled: isEdit.value,
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
                  onPressed: () {},
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
