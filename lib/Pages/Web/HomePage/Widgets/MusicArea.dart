import 'package:flutter/material.dart';

class MusicArea extends StatelessWidget {
  const MusicArea({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Row(
            children: [
              w > 1000
                  ? Container(
                      width: w / 10,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.background,
                      ),
                    )
                  : const SizedBox(),
              w > 1000 ? SizedBox(width: 10) : const SizedBox(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_previous_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_next_rounded),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      value: 10,
                      onChanged: (value) {},
                      min: 0,
                      max: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Hare krishna hare rama",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
