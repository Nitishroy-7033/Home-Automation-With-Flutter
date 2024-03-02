import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/Models/DeviceData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DeviceStatics extends StatelessWidget {
  final List<DeviceData> data;
  final String title;
  const DeviceStatics({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(5),
      child: SfCartesianChart(
        title: ChartTitle(text: title),
        primaryXAxis: DateTimeAxis(
          majorTickLines: MajorTickLines(size: 0),
          axisLine: AxisLine(width: 0),
          minorTickLines: MinorTickLines(size: 0),
          borderWidth: 0,
          axisBorderType: AxisBorderType.withoutTopAndBottom,
          majorGridLines: MajorGridLines(
              width: 2, color: Theme.of(context).colorScheme.background),
          minorGridLines: MinorGridLines(
              width: 2, color: Theme.of(context).colorScheme.background),
          dateFormat: DateFormat.MMMd(),
        ),
        series: [
          ColumnSeries<DeviceData, DateTime>(
            color: Theme.of(context).colorScheme.primary,
            enableTooltip: true,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            dataSource: data,
            xValueMapper: (DeviceData data, _) => data.dateTime,
            yValueMapper: (DeviceData data, _) => data.value,
          )
        ],
      ),
    );
  }
}
