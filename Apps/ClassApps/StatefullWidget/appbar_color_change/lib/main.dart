import "package:flutter/material.dart";
void main(){
  runApp(const AppbarColorApp());
}

class AppbarColorApp extends StatefulWidget{
  const AppbarColorApp({super.key});

@override
State<AppbarColorApp>createState() => _AppbarColorAppState();
}

class _AppbarColorAppState extends State<AppbarColorApp>{
  bool colorChange = true;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Appbar Color",
      home: Scaffold(
        appBar:AppBar(
          title: const Text("Appbar Color App"),
          titleTextStyle:  const TextStyle(fontSize: 25),
          centerTitle: true,
          backgroundColor:(colorChange) ? Colors.amber : Colors.blue,
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Change Appbar color"),
              Container(
                width: 250,
                height: 250,
                color: (colorChange) ? Colors.red : Colors.black,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(colorChange){
              colorChange=false;
            }
            else{
              colorChange=true;
            }
            setState(() {});
          },
          child: const Icon(Icons.add),
          ),
        ),
    );
  }
}