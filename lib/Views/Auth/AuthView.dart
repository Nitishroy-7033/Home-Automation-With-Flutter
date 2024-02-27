import 'package:flutter/material.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Pages/Web/Auth/AuthPage.dart';

import '../../Pages/Mobile/Auth/AuthPage.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileAuthPage(),
      desktop: WebAuthPage(),
    );
  }
}
