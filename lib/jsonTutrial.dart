import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JSONTUTORIAL extends StatefulWidget {
  JSONTUTORIAL({Key? key}) : super(key: key);

  @override
  State<JSONTUTORIAL> createState() => _JSONTUTORIALState();
}

class _JSONTUTORIALState extends State<JSONTUTORIAL> {
  var data;
 List<ChartData> chartDataList = [];
  Future<List<ChartData>> getChartDataList() async {
   
    http.Response response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=inr&days=7'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      List dataList = data["prices"];
      for (int i = 0; i < dataList.length;i++) {
        ChartData singleData = ChartData(
            price: data["prices"][i][0].toString(),
            time: data["prices"][i][0].toString());
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
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text("JSONData"),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: getChartDataList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Text(chartDataList[2].time);
                      }
                    })),
          ],
        ));
  }
}

class ChartData {
  String price;
  String time;
  ChartData({required this.price, required this.time});
}
