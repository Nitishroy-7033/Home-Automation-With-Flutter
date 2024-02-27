import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/BottomButton.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Pages/Mobile/HomePage/Widgets/AppBar.dart';
import 'package:smart_home/Pages/Mobile/HomePage/Widgets/RoomCard.dart';
import 'package:smart_home/Views/Room/RoomView.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Bottombutton(
        btnName: "Add room",
        icon: Icons.add,
        onTap: () {
          print("Add room");
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Hello, Ni30 ⭐",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    RoomCard(
                      roomName: "Living room",
                      deviceCount: "4",
                      icon: Icons.bed,
                      onTap: () {
                        Get.to(RoomView());
                      },
                    ),
                    RoomCard(
                      roomName: "Study room",
                      deviceCount: "1",
                      icon: Icons.light,
                      onTap: () {
                        print("Living room");
                      },
                    ),
                    RoomCard(
                      roomName: "Movie room",
                      deviceCount: "1",
                      icon: Icons.movie_creation,
                      onTap: () {
                        print("Living room");
                      },
                    ),
                    RoomCard(
                      roomName: "Study room",
                      deviceCount: "1",
                      icon: Icons.light,
                      onTap: () {
                        print("Living room");
                      },
                    ),
                    RoomCard(
                      roomName: "Study room",
                      deviceCount: "1",
                      icon: Icons.light,
                      onTap: () {
                        print("Living room");
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
