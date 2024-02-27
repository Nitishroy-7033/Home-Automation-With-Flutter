import 'package:flutter/material.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Pages/Mobile/Rooms/RoomPage.dart';
import 'package:smart_home/Pages/Web/Rooms/RoomPage.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileRoomPage(),
      desktop: WebRoomPage(),
    );
  }
}
