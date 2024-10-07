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
            "ListViews Demo",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: ListView(
          children: [
            Image.network(
              "https://phlearn.com/wp-content/uploads/2019/03/fixed-ratio.png",
            ),
            const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            const Text(
              "Nature",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.network(
              "https://phlearn.com/wp-content/uploads/2019/03/fixed-ratio.png",
            ),
            GestureDetector(
              onTap: () {
                print("Button presssed");
              },
              child: Container(
                height: 50,
                color: Colors.greenAccent,
                child: const Text(
                  "Press me",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
