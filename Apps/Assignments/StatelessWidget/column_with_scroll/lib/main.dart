import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Column Scroll",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https://phlearn.com/wp-content/uploads/2019/03/fixed-ratio.png"
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.greenAccent,
              ),
               Image.network(
                "https://phlearn.com/wp-content/uploads/2019/03/fixed-ratio.png"
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.purpleAccent,
              ),
               Image.network(
                "https://phlearn.com/wp-content/uploads/2019/03/fixed-ratio.png"
                ),
                 Container(
                  height: 200,
                  width: 200,
                  color: Colors.yellowAccent,
              ),
            ],
          ) ,
          ),
      ),
    );
  }
}
