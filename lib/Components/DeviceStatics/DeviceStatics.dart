import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DeviceStatics extends StatelessWidget {
  const DeviceStatics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      GraphData("Mon", 10),
      GraphData("Tue", 5),
      GraphData("Wed", 30),
      GraphData("Thu", 40),
      GraphData("Fri", 50),
      GraphData("Sat", 40),
      GraphData("Sun", 30),
    ];
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(5),
      child: SfCartesianChart(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        primaryYAxis: NumericAxis(minimum: 0, maximum: 50, interval: 10),
        primaryXAxis: CategoryAxis(
          labelStyle:
              TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        isTransposed: false,
        title: ChartTitle(
          text: "Weekly Usage",
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        series: <CartesianSeries<GraphData, String>>[
          ColumnSeries<GraphData, String>(
            dataSource: data,
            xValueMapper: (GraphData sales, _) => sales.time,
            yValueMapper: (GraphData sales, _) => sales.value,
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          ),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}

class GraphData {
  final String time;
  final int value;

  GraphData(
    this.time,
    this.value,
  );
}
