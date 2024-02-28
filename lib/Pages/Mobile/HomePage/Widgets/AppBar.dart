import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Views/ProfilePage/ProfileView.dart';

import '../../../../Conifg/AssestPaths.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        child: SvgPicture.asset(IconPaths.menu),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              IconPaths.wifi,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 18,
            ),
            SizedBox(width: 10),
            Text(
              '198.168.43:54423',
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      ),
      InkWell(
        onTap: () {
          Get.to(ProfileView());
        },
        child: CircleAvatar(
          child: Text("N"),
        ),
      )
    ]);
  }
}
