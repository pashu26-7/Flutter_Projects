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
            "Flutter App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.redAccent,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
              ),
               IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.alarm,
                color: Colors.purpleAccent,
              ),
              ),
          ],
        ),
      ),
    );
  }
}
