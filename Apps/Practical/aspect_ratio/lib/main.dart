

import 'package:flutter/material.dart';

void main(){
  runApp(const Aspect_RatioApp ());
}

class Aspect_RatioApp extends StatefulWidget {
  const Aspect_RatioApp({super.key});

  @override
  State<Aspect_RatioApp> createState() => _Aspect_RatioAppState();
}

class _Aspect_RatioAppState extends State<Aspect_RatioApp> {
  TextEditingController nameController = TextEditingController();

  String? myName;
  List<String> playerList =[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      appBar:AppBar(
        title: const Text(
          "Aspect Ratio Demo",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ) ,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.amber,
          child: Image.network(
            "https://img.freepik.com/free-photo/beautiful-flowers-with-water-drops_23-2150705665.jpg?size=338&ext=jpg&ga=GA1.1.1819120589.1728172800&semt=ais_hybrid",
          ),
        ),
      ),
      ),
    );
  }
}
