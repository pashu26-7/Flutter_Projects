import 'package:flutter/material.dart';

void main() {
  runApp(const SingerApp());
}

class SingerApp extends StatefulWidget {
  const SingerApp({super.key});
  @override
  State<SingerApp> createState() => _SingerAppState();
}

class _SingerAppState extends State<SingerApp> {
  int _counter = 0;
  List<String> singerList = <String>[
    "https://www.therevolverclub.com/cdn/shop/articles/Shreya_Ghoshal_s_Journey.jpg?v=1700559084&width=1366",
    "https://www.koimoi.com/wp-content/new-galleries/2019/12/pop-sensation-dhvani-bhanushali-is-ready-to-set-the-stage-on-fire-at-the-star-screen-awards-2019-001.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Tri_Nation_Mega_Concert_Sonu_Nigam_%288388639915%29.jpg/800px-Tri_Nation_Mega_Concert_Sonu_Nigam_%288388639915%29.jpg",
    "https://static.abplive.com/wp-content/uploads/2020/09/28172945/lata-mangeshkar.jpg",
    "https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2016/12/19/8c96a19813af92bb8d9f923add88f70e.jpg?quality=80&zoom=1&ssl=1",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Singers",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Indian Singers"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                singerList[_counter],
                height: 300,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            FloatingActionButton(
              onPressed: () {
                if (_counter > 0) {
                  _counter--;
                } else {
                  _counter = singerList.length - 1;
                }
                setState(() {});
              },
              tooltip: 'Back',
              backgroundColor: Colors.purple,
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 200,
            ),
            FloatingActionButton(
              onPressed: () {
                if (_counter < singerList.length - 1) {
                  _counter++;
                } else {
                  _counter = 0;
                }
                setState(() {});
              },
              tooltip: 'Increment',
              backgroundColor: Colors.purple,
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
