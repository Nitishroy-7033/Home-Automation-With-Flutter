import 'package:flutter/material.dart';

class Bottombutton extends StatelessWidget {
  const Bottombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                Icon(Icons.home),
                SizedBox(width: 10),
                Text(
                  "Add Room",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ],
      );
  }
}