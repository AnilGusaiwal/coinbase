import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'buyCoin.dart';

class ChartData {
  double price;
  String time;
  ChartData({required this.time, required this.price});
}

class SeeCrypto extends StatefulWidget {
  SeeCrypto({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.link,
  });

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;
  String link;

  @override
  State<SeeCrypto> createState() => _SeeCryptoState();
}

class _SeeCryptoState extends State<SeeCrypto> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40000.5560)
  ];
  bool isDoller = true;

  List<ChartData> chartDataListX = [
    ChartData(time: "1", price: 1),
    ChartData(time: "2", price: 1),
    ChartData(time: "3", price: 1),
    ChartData(time: "4", price: 1),
    ChartData(time: "5", price: 1),
    ChartData(time: "6", price: 1),
    ChartData(time: "7", price: 1),
  ];
  List<ChartData> chartDataList = [];

  Future<List<ChartData>> getChartDataList() async {
    http.Response response = await http.get(Uri.parse(widget.link));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      List dataList = data["prices"];
      for (int i = 0; i < dataList.length; i++) {
        ChartData singleData = ChartData(
            price: data["prices"][i][1],
            // time: data["prices"][i][0].toString(),
            time: "${i}");
        chartDataList.add(singleData);
      }
      return chartDataList;
    } else {
      return [];
    }
  }

  @override
  void initState() {
    getChartDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: Icon(
              Icons.star_outline_outlined,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
        title: Text(
          "${widget.symbol.toUpperCase()}",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    //  color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      // BoxShadow(
                      //   color: Color.fromARGB(255, 99, 55, 55),
                      //   offset: Offset(4, 4),
                      //   blurRadius: 10,
                      //   spreadRadius: 1,
                      // ),
                      // BoxShadow(
                      //   color: Colors.white,
                      //   offset: Offset(-4, -4),
                      //   blurRadius: 10,
                      //   spreadRadius: 1,
                      // ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              // BoxShadow(
                              //   color: Color.fromARGB(255, 125, 98, 98),
                              //   offset: Offset(4, 4),
                              //   blurRadius: 10,
                              //   spreadRadius: 1,
                              // ),
                              // BoxShadow(
                              //   color: Colors.white,
                              //   offset: Offset(-4, -4),
                              //   blurRadius: 10,
                              //   spreadRadius: 1,
                              // ),
                            ],
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(widget.imageUrl),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                widget.symbol,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "₹ ${widget.price.toDouble().toString()}",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.change.toDouble() < 0
                                  ? widget.change.toDouble().toStringAsFixed(4)
                                  : '+' +
                                      widget.change
                                          .toDouble()
                                          .toStringAsFixed(4),
                              style: TextStyle(
                                color: widget.change.toDouble() < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.changePercentage.toDouble() < 0
                                  ? widget.changePercentage
                                          .toDouble()
                                          .toStringAsFixed(2) +
                                      '%'
                                  : '+' +
                                      widget.changePercentage
                                          .toDouble()
                                          .toStringAsFixed(2) +
                                      '%',
                              style: TextStyle(
                                color: widget.changePercentage.toDouble() < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                  future: getChartDataList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          //  primaryYAxis:CategoryAxis() ,

                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<ChartData, String>>[
                            LineSeries<ChartData, String>(
                                dataSource: chartDataList,
                                xValueMapper: (ChartData sales, _) =>
                                    sales.time,
                                yValueMapper: (ChartData sales, _) =>
                                    sales.price,
                                name: '${widget.symbol.toUpperCase()}',
                                // Enable data label
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: false))
                          ]);
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: TextButton(autofocus: true,
                      child: Text(
                        "1D",
                        style: TextStyle(color: Color.fromARGB(255, 157, 139, 139)),
                      ),
                      onPressed: () {},
                    ))),
                    Expanded(
                        child: Center(
                            child: TextButton(
                      child: Text(
                        "1W",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {},
                    ))),
                    Expanded(
                        child: Center(
                            child: TextButton(
                      child: Text(
                        "1M",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {},
                    ))),
                    Expanded(
                        child: Center(
                            child: TextButton(
                      child: Text(
                        "1Y",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {},
                    ))),
                    Expanded(
                        child: Center(
                            child: TextButton(
                      child: Text(
                        "5Y",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {},
                    ))),
                  ],
                ),
              )
              
            ],
          )),
          Container(
            color: Colors.blueAccent,
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Center(
                  child: Container(
                    color: Colors.blueAccent,
                    child: InkWell(
                      onTap: () {
                   Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BuyCoin()
                    ));
                  },
                      child: Text(
                        "BUY",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                )),
                Container(
                  width: 1.0,
                  height: 50,
                  color: Colors.white,
                ),
                Expanded(
                    child: Center(
                  child: Container(
                    color: Colors.blueAccent,
                    child: Text(
                      "SELL",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
