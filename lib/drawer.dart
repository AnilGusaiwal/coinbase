import 'package:flutter/material.dart';

import 'home.dart';

class Drawer1 extends StatefulWidget {
  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding:  EdgeInsets.only(top: 40, left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                    backgroundColor: Colors.transparent,
                    
                    
                  ),
                   Text(
                  'Anil Gusaiwal',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                          },
                          child:  Text(
                            'Profile & Settings',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            backgroundColor:
                                 Color.fromARGB(133, 202, 201, 201),
                          )),
                 SizedBox(height: 20,),
                  ListTile(
                  leading: const Icon(Icons.percent),
                  title: const Text(
                    'Earn yield',
                    textScaleFactor: 1.5,
                  ),
                  onTap: () {
                  },
                ),
                SizedBox(height: 20,),
                  ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text(
                    'Invite friends',
                    textScaleFactor: 1.5,
                  ),
                  onTap: () {
                  },
                ),
                SizedBox(height: 20,),
                  ListTile(
                  leading: const Icon(Icons.card_giftcard),
                  title: const Text(
                    'Send a Gift',
                    textScaleFactor: 1.5,
                  ),
                  onTap: () {
                  },
                ),

               SizedBox(height: 250,),
                OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                        },
                        child:  Text(
                          'SIGNOUT',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor:
                               Color.fromARGB(133, 202, 201, 201),
                        )),
            
          ],
        ),
      ),
    );
  }
}
