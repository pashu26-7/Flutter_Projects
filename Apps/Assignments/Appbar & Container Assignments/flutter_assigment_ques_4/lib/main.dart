

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: const Text(
            "Double Container",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          //color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.yellowAccent,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}