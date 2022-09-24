import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuyCoin extends StatefulWidget {
  @override
  State<BuyCoin> createState() => _BuyCoinState();
}

class _BuyCoinState extends State<BuyCoin> {
  final TextEditingController _priceController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _priceController;
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'This is toast notification',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(153, 35, 72, 100),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: Text(
          "Buy BTC",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("INR Amount"),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: _priceController,
                      decoration: InputDecoration(
                          hintText: " ₹ 0", border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    Text(
                      "Balance 0.64",
                      style: TextStyle(color: Colors.black87),
                    ),
                    Text(
                      "Min₹100 | Min₹100",
                      style: TextStyle(color: Colors.black87),
                    ),
                    Text(
                      "₹ 1000",
                      style: TextStyle(color: Colors.black87),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor:Colors.green,
                          value: isChecked,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                              //  isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "One Time Buy",
                          style: TextStyle(color: Colors.black87),
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor:Colors.green,
                          value: false,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            showToast();
                            setState(() {
                              //  isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "Montly SIP",
                          style: TextStyle(color: Colors.black87),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
