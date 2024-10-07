
import "package:flutter/material.dart";
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Three Network Image App",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
            centerTitle: true,
            backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://images.news18.com/webstories/2023/10/9574e0fa482506f7d39737c31a5c15fd.jpeg",
               width: 150,
              height: 150
            ),
            const SizedBox(
              height: 10,
            ),
             Image.network(
              "https://images.news18.com/webstories/2023/10/9574e0fa482506f7d39737c31a5c15fd.jpeg",
              width: 150,
              height: 150,     
              ),
               const SizedBox(
              height: 10,
            ),
             Image.network(
             width: 150,
             height: 150,
              "https://images.news18.com/webstories/2023/10/9574e0fa482506f7d39737c31a5c15fd.jpeg",
            ),
          ],
        ),
      ),
  ),                                                                                                                                                                                                                                                                                                                                                                      
    );
  }
}
