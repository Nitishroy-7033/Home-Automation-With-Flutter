import 'package:flutter/material.dart';
import 'package:smart_home/Pages/Mobile/Auth/Widgets/Heading.dart';

import 'Widgets/AuthPageBody.dart';

class MobileAuthPage extends StatelessWidget {
  const MobileAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeHeading(),
                SizedBox(height: 60),
                AuthPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
