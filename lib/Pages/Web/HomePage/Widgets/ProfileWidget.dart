import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(width: 10),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(width: 10),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(width: 10),
            ],
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: Text("A"),
          ),
          SizedBox(height: 10),
          Text(
            "Nitish Kumar",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "NitishKumar@gmail.com",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Other users",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: Text("A"),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: Text("A"),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: Text("A"),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: Text("A"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
