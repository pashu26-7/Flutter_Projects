import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "container Round",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            //color: Colors.cyan,
            decoration:const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(20),
              bottomRight:Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
