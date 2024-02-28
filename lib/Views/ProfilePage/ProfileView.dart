import 'package:flutter/material.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Pages/Mobile/ProfilePage/ProfilePage.dart';
import 'package:smart_home/Pages/Web/ProfilePage/ProfilePage.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileProfilePage(),
      desktop: WebProfilePage(),
    );
  }
}
