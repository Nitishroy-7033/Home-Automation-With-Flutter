import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Pages/Mobile/Welcome/WelcomePage.dart';
import 'package:smart_home/Pages/Web/Welcome/WelcomePage.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileWelcomePage(),
      desktop: WebWelcomePage(),
    );
  }
}
