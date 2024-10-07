import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Indian Flag"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 460,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    width: 190,
                    height: 450,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 350,
                          height: 40,
                          color: Colors.orange,
                        ),
                        Container(
                          width: 350,
                          height: 40,
                          color: Colors.white,
                          child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Ashoka_Chakra.svg/2048px-Ashoka_Chakra.svg.png"),
                        ),
                        Container(
                          width: 350,
                          height: 40,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children:[
                Column(
                children: [
                  Container(
                    width: 140,
                    height: 40,
                    color: Colors.brown,
                  ),
                  Container(
                    width: 180,
                    height: 40,
                    color: Colors.brown,
                  ),
                  Container(
                    width: 230,
                    height: 40,
                    color: Colors.brown,
                    
                  ),
                ],
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
