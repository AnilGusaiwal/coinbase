import 'package:coinbase/market.dart';
import 'package:flutter/material.dart';

import 'home.dart';
class BottomBar extends StatefulWidget {

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String WelcomeMassage(String massage) {
    return massage;
    
  }
  int currentTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Tabs = [Home(), Market(),Home()];
    
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blueGrey.shade300, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Tabs[currentTapIndex],
          
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentTapIndex,
              onTap: (currentIndex) {
                currentTapIndex = currentIndex;
                setState(() {
                  build;
                });
              },
              elevation: 0.0,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black87,
              //  selectedItemColor: Colors.blue,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.assessment), label: "Market"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: "Portfolio"),
              ]),
        ),
      
    );
  }
}
