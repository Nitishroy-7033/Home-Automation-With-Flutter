import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/Components/BottomButton.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Pages/Mobile/HomePage/Widgets/AppBar.dart';
import 'package:smart_home/Pages/Mobile/HomePage/Widgets/RoomCard.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Bottombutton(),
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
                  children: const [
                    RoomCard(
                      roomName: "Living room",
                      deviceCount: "4",
                      icon: Icons.bed,
                    ),
                    RoomCard(
                      roomName: "Study room",
                      deviceCount: "1",
                      icon: Icons.light,
                    ),
                    RoomCard(
                      roomName: "Movie room",
                      deviceCount: "1",
                      icon: Icons.movie_creation,
                    ),
                    RoomCard(
                      roomName: "Study room",
                      deviceCount: "1",
                      icon: Icons.light,
                    ),
                    RoomCard(
                      roomName: "Study room",
                      deviceCount: "1",
                      icon: Icons.light,
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
