import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerTile extends StatelessWidget {
  final RxString onTime;
  final RxString offTime;

  const TimerTile({
    super.key,
    required this.onTime,
    required this.offTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "On Time",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  onTime.value = time.format(context);
                  print(onTime.value);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.timer_sharp,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => Text(onTime.value,
                          style: Theme.of(context).textTheme.bodyLarge),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Off Time",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  offTime.value = time.format(context);
                  print(offTime.value);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => Text(offTime.value,
                          style: Theme.of(context).textTheme.bodyLarge),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
