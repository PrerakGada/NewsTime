// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
// class WinLossDataPoint {
//   final String x;
//   final double open;
//   final double close;
//
//   WinLossDataPoint(this.x, this.open, this.close);
// }
// class TestingScreen extends StatelessWidget {
//   static const String id = 'testing';
//
//   TestingScreen({Key? key}) : super(key: key);
//
//   final List<WinLossDataPoint> data = <WinLossDataPoint>[
//     WinLossDataPoint('Jan', 2.5, 3),
//     WinLossDataPoint('Feb', -2, 1),
//     WinLossDataPoint('Mar', -1.5, 1),
//     WinLossDataPoint('Apr', 2, 2),
//     WinLossDataPoint('May', -2.5, 1),
//     WinLossDataPoint('Jun', 1, 2),
//     WinLossDataPoint('Jul', -2, 1),
//     WinLossDataPoint('Aug', 1.5, 2),
//     WinLossDataPoint('Sep', -1, 1),
//     WinLossDataPoint('Oct', 2, 2),
//     WinLossDataPoint('Nov', -2.5, 1),
//     WinLossDataPoint('Dec', 3, 3),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SfSparkWinLossChart Example'),
//       ),
//       body: Center(
//         child: SfSparkWinLossChart(
//           data: data,
//           color: const Color.fromRGBO(57, 150, 230, 1),
//           negativePointsColor: const Color.fromRGBO(239, 83, 80, 1),
//           axisLineColor: const Color.fromRGBO(0, 0, 0, 0.3),
//           axisLineWidth: 1,
//           labelPrefix: '\$',
//           labelSuffix: 'B',
//           xValueMapper: (WinLossDataPoint data, _) => data.x,
//           openValueMapper: (WinLossDataPoint data, _) => data.open,
//           closeValueMapper: (WinLossDataPoint data, _) => data.close,
//         ),
//       ),
//     );
//   }
// }
//
// class _SalesData {
//   _SalesData(this.year, this.sales);
//
//   final String year;
//   final double sales;
// }
