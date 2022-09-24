import 'package:flutter/material.dart';

class Coin {
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercentage;
  String id;
  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.id,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        name: json['name'],
        symbol: json['symbol'],
        imageUrl: json['image'],
        price: json['current_price'],
        change: json['price_change_24h'],
        changePercentage: json['price_change_percentage_24h'],
        id: json["id"]);
  }
}

List<Coin> coinList = [];
