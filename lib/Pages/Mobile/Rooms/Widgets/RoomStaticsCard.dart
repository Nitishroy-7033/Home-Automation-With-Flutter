import 'package:flutter/material.dart';

class RoomStaticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool isWeb;
  const RoomStaticsCard(
      {super.key,
      required this.title,
      required this.value,
      required this.icon,
      this.isWeb = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isWeb
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 6),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
