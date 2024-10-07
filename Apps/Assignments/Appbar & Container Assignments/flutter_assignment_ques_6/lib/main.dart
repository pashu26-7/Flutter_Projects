

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text(
            "Column Scrollable",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyanAccent,
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.pinkAccent,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.deepPurple,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.greenAccent,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.orangeAccent,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.lightBlue,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.blueGrey,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.brown,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.black,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.purple,
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
