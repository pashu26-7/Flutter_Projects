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
            "5 Network Images",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            centerTitle: true,
            backgroundColor: Colors.cyan,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              child: Row(
                children: [
                 Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    "https://5.imimg.com/data5/MB/NQ/LH/SELLER-32174847/customized-god-wallpaper-500x500.jpg",
                    width: 150,
                    height: 320,
                 ),
                 ),
                 const SizedBox(
                  height: 30,
                 ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP8y-BNRBmC4vYBnc_YQ_ckOc5yChzEWE0EQ&s",
                    width: 150,
                    height: 320,
                 ),
                 ),
                 const SizedBox(
                  height: 30,
                 ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    "https://media.istockphoto.com/id/1309482140/photo/browse-high-resolution-stock-images-of-lord-hanuman.jpg?s=612x612&w=0&k=20&c=IyRQG-TTcPDfCgtecH4XFr3nFSJYq2t_k-NLFbDYNhY=",
                    width: 150,
                    height: 320,
                 ),
                 ),
                 const SizedBox(
                  height: 30,
                 ),
                 Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    "https://i.guim.co.uk/img/media/3f29827729071dd891107ba9bb07d9c756d5b5a6/0_2_2400_1440/master/2400.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=8c23e2fc0a1be1ed5753f0e27da9247c",
                    width: 150,
                    height: 320,
                 ),
                 ),
                 const SizedBox(
                  height: 30,
                 ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2024/04/03/23/11/god-8674031_640.jpg",
                    width: 150,
                    height: 320,
                 ),
                 ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
