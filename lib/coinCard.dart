import 'package:coinbase/seeCrypto.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.id
  });

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;
  String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SeeCrypto(
                      name: name,
                      symbol: symbol,
                      imageUrl: imageUrl,
                      price: price,
                      change: change,
                      changePercentage: changePercentage,
                      link:
                          'https://api.coingecko.com/api/v3/coins/${id}/market_chart?vs_currency=inr&days=1000',
                    )));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 125, 98, 98),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(imageUrl),
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
                          name,
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        symbol.toUpperCase(),
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
                      "₹ ${price.toDouble().toString()}",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      change.toDouble() < 0
                          ? change.toDouble().toStringAsFixed(4)
                          : '+' + change.toDouble().toStringAsFixed(4),
                      style: TextStyle(
                        color:
                            change.toDouble() < 0 ? Colors.red : Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      changePercentage.toDouble() < 0
                          ? changePercentage.toDouble().toStringAsFixed(2) + '%'
                          : '+' +
                              changePercentage.toDouble().toStringAsFixed(2) +
                              '%',
                      style: TextStyle(
                        color: changePercentage.toDouble() < 0
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
    );
  }
}
