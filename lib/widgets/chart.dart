import 'package:finance_app/model/sales.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        series: <SplineSeries<Sales, String>>[
          SplineSeries<Sales, String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <Sales>[
              Sales(100, 'mon'),
              Sales(20, 'Tue'),
              Sales(40, 'Wen'),
              Sales(15, 'Sat'),
            ],
            xValueMapper: (Sales sales, _) => sales.year,
            yValueMapper: (Sales sales, _) => sales.sales,
          )
        ],
      ),
    );
  }
}
