import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar:AppBar(
          title: const Text(
            "Flutter Apps",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
             icon: const Icon(
              Icons.favorite,
            color: Colors.pink,
            ),
            ),
           const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: (){},
             icon: const Icon(
              Icons.shopping_bag,
            color: Colors.greenAccent,
            ),
            ),
          ],
          //centerTitle: true,
          backgroundColor: Colors.amberAccent,
        ),
      ),
    );
  }
}
