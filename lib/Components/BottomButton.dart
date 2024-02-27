import 'package:flutter/material.dart';

class Bottombutton extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback onTap;
  const Bottombutton(
      {super.key,
      required this.btnName,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
             splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 10),
                Text(
                  btnName,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
