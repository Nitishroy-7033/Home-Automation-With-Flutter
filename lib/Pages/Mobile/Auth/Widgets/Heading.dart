import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Conifg/Strings.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.logo),
          ],
        ),
        SizedBox(height: 20),
        Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(),
        ),
      ],
    );
  }
}
