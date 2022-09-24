import 'package:coinbase/buyCoin.dart';
import 'package:coinbase/providers/market_provider.dart';
import 'package:coinbase/splashScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to Flutter',
        home:  SplashScreen(),
          
        
      ),
    );
  }
}
