 import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Instagram",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram Stories"),
        backgroundColor: const Color.fromARGB(255, 61, 114, 157),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
             Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
             ),
             
              Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              ),
               Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              ),
               Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 31, 119, 178),
                shape: BoxShape.circle,
              ),
              ),
               Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 83, 168, 139),
                shape: BoxShape.circle,
              ),
              ),
          ],
        ),
      ),
    );
  }
}
