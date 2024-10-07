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
            "Container with border",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            alignment:Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
              color: Colors.red,
            ),
            ),
            ),
        ),
      ),
    );
  }
}
