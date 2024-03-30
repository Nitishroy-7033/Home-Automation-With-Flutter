import 'package:flutter/material.dart';
import 'package:smart_home/Conifg/ResponsiveLayout.dart';
import 'package:smart_home/Models/DeviceModel.dart';
import 'package:smart_home/Models/RoomModel.dart';
import 'package:smart_home/Pages/Mobile/Rooms/RoomPage.dart';
import 'package:smart_home/Pages/Web/Rooms/RoomPage.dart';

class RoomView extends StatelessWidget {
  final RoomModel room;
  const RoomView({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileRoomPage(
        room: room,
      ),
      desktop: WebRoomPage(),
    );
  }
}
