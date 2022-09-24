import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../models/cryptoCurrency.dart';
import '../servies/api.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> markets = [];

  // MarketProvider() {
  //   fetchData();
  // }

  Future<void> fetchData() async {
    List<dynamic> _markets = await API.getMarkets();

    List<CryptoCurrency> temp = [];
    for (var market in _markets) {
      CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);

      temp.add(newCrypto);
    }

    markets = temp;
    isLoading = false;
    notifyListeners();
  }

  List<CryptoCurrency> get getCryptoList {
    return markets;
  }

  CryptoCurrency fetchCryptoById(String id) {
    CryptoCurrency crypto =
        markets.where((element) => element.id == id).toList()[0];
    return crypto;
  }

  // void addFavorite(CryptoCurrency crypto) async {
  //   int indexOfCrypto = markets.indexOf(crypto);
  //   markets[indexOfCrypto].isFavorite = true;
  //   await LocalStorage.addFavorite(crypto.id!);
  //   notifyListeners();
  // }

  // void removeFavorite(CryptoCurrency crypto) async {
  //   int indexOfCrypto = markets.indexOf(crypto);
  //   markets[indexOfCrypto].isFavorite = false;
  //   await LocalStorage.removeFavorite(crypto.id!);
  //   notifyListeners();
  // }

}
