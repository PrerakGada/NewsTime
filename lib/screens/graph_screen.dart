import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  GraphScreen({this.data});
  final List? data;
  static const id = '/graphRoute';
  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  String userId = '';
  String id = '';
  String apiKey = '';
  List<ChartData> chartData = [];
  bool pressed = false;

  bool areApisCalled = false;
  // void func() {
  //
  //   _seriesLineData.add(
  //     charts.Series(
  //       colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
  //       id: 'Air Pollution',
  //       data: linesalesdata,
  //       domainFn: (Sales sales, _) => sales.yearval,
  //       measureFn: (Sales sales, _) => sales.salesval,
  //     ),
  //   );
  //   _seriesLineData.add(
  //     charts.Series(
  //       colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
  //       id: 'Air Pollution',
  //       data: linesalesdata1,
  //       domainFn: (Sales sales, _) => sales.yearval,
  //       measureFn: (Sales sales, _) => sales.salesval,
  //     ),
  //   );
  //   _seriesLineData.add(
  //     charts.Series(
  //       colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
  //       id: 'Air Pollution',
  //       data: linesalesdata2,
  //       domainFn: (Sales sales, _) => sales.yearval,
  //       measureFn: (Sales sales, _) => sales.salesval,
  //     ),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // func();
    callApis();
  }

  void callApis() async {
    for (int i = 0; i < min(1, widget.data!.length); i++) {
      widget.data![i].forEach((k, v) => chartData.add(ChartData(
          "${DateTime.fromMillisecondsSinceEpoch((int.parse(k)) * 1000)}",
          v,
          2,
          Colors.red)));

      // chartData.add(ChartData(analytics[i]['text'], int.parse(analytics[i]['value'])));
      // chartData.add(ChartData(
      //     "${DateFormat('dd MMM').format(date).toString()}\n${widget.data![i]['text']}",
      //     int.parse("${widget.data![i]['orderCount']}"),
      //     int.parse("${widget.data![i]['orderAmount']}"),
      //     Colors.red));
    }

    setState(() {
      areApisCalled = true;
    });
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // id = prefs.getString('id');
    // userId = prefs.getString('userId');
    // id = prefs.getString('id');
    // apiKey = prefs.getString('APIKey');
    //
    // String body = jsonEncode({
    //   "creator": {
    //     "createDate":DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    //     "creatorId": userId,
    //     "id": id,
    //     "APIKey": apiKey,
    //     "applicationId": "4"
    //   },
    //   "reportCreatedBy":"",
    //   "reportId":"",
    //   "reportStatusATVP":"121",
    //   "reportStartDate":"2022-05-16",
    //   "reportEndDate":"2022-06-16",
    //   "campusId":"",
    //   "assignedTo":"",
    //   "reportSubCategoryId":"",
    //   "start":0,
    //   "limit":1
    // });
    //
    // String url = '$baseUrl/report/getAnalytics';
    //
    // var response = await http.post(
    //   Uri.parse(url),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: body
    // );

    // if(response.statusCode == 200){
    //   print('inside1');
    //   var data = jsonDecode(response.body);
    //   if(data['baseResponse']['statusCode'] == '200'){
    //     List analytics = data['analytics'];
    //     int length = analytics.length;
    //     for(int i = 0; i < min(30, length); i++){
    //       // chartData.add(ChartData(analytics[i]['text'], int.parse(analytics[i]['value'])));
    //       chartData.add(ChartData(i.toString(), int.parse(analytics[i]['value'])));
    //     }
    //     setState((){
    //       areApisCalled = true;
    //     });
    //   }else{
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed loading analytics, please try again later!')));
    //   }
    // }else{
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed loading analytics, please try again later!')));
    // }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return areApisCalled == false
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : WillPopScope(
            onWillPop: () async {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitDown,
                DeviceOrientation.portraitUp,
              ]);
              return true;
            },
            child: SafeArea(
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                          // color: Colors.white,
                          // height: Constants.height * 0.7,
                          child: SfCartesianChart(
                              title: ChartTitle(text: 'Monthly Open Analysis'),
                              primaryXAxis: CategoryAxis(
                                title: AxisTitle(
                                  text: 'Date',
                                ),

                                // primaryYAxis: NumericAxis(
                                // '°C' will be append to all the labels in Y axis

                                // )
                              ),
                              primaryYAxis: NumericAxis(
                                  title: AxisTitle(text: 'Orders'),
                                  labelFormat: "{value}"),
                              //     series: <CartesianSeries>[
                              //   ColumnSeries<ChartData, String>(
                              //       dataSource: chartData,
                              //       xValueMapper: (ChartData data, _) => data.x,
                              //       yValueMapper: (ChartData data, _) => data.y),

                              // ]
                              series: <ChartSeries<ChartData, String>>[
                            // Renders column chart
                            LineSeries<ChartData, String>(
                              enableTooltip: true,
                              dataSource: chartData,
                              pointColorMapper: (ChartData data, _) =>
                                  data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                            ),
                            // LineSeries<ChartData, String>(
                            //     dataSource: chartData,
                            //     xValueMapper: (ChartData data, _) => data.x,
                            //     yValueMapper: (ChartData data, _) => data.y1)
                          ])),
                      // )),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.color);
  final String x;
  final double y;
  final int y1;
  final Color color;
}

// class ChartData2 {
//   ChartData2(this.x, this.y);
//   final String x;
//   final int y;
// }

class Sales {
  String date;
  String value;

  Sales(this.date, this.value);
}
