import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:core';

import 'package:coinbase/coinCard.dart';
import 'package:coinbase/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'coinModel.dart';
import 'models/chartData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isDoller = true;
  late TabController _tabController;
  
  List<Tab> tabs = [
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
    Tab(
      child: Text("asd"),
    ),
  ];

  Future<List<CryptoChartData>> fetchCoinChart() async {
    list = [];

    http.Response response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=inr&days=7'));

    if (response.statusCode == 200) {
      Map<String, List<List<double>>> values = HashMap();
      values = json.decode(response.body);
      List<List<double>>? dataList = values["prices"];
      if (dataList!.isNotEmpty) {
        for (int i = 0; i < dataList.length; i++) {
          List<double> singleData = [];
          singleData = dataList[i];

          list.add(CryptoChartData(singleData[0], singleData[1]));
        }
      }
      return list;
    }
    // if (values["prices"].isNotEmpty) {
    //   for (int i = 0; i <values["prices"].length; i++) {
    //     if (values["prices"][i] != null) {
    //       Map<String, dynamic> map =values["prices"][i];
    //       coinList.add(Coin.fromJson(map));
    //     }
    //   }
    //   return _list;
    // }
    else {
      throw Exception('Failed to load coins');
    }
  }

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=2000&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabs.length);
    fetchCoin();
    fetchCoinChart();
    Timer.periodic(Duration(seconds: 3),
        (timer) => fetchCoin().then((value) => print("HiAnil")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Drawer1(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        // bottom: T,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {
              print(list);
            },
          ),
        ],
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'COINBASE',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          return CoinCard(
            name: coinList[index].name,
            symbol: coinList[index].symbol,
            imageUrl: coinList[index].imageUrl,
            price: coinList[index].price.toDouble(),
            change: coinList[index].change.toDouble(),
            changePercentage: coinList[index].changePercentage.toDouble(),
            id: coinList[index].id,
          );
        },
      ),
    );
  }
}
