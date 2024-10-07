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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Container(
              padding: const EdgeInsets.only(left: 10),
            // child:  IconButton(
            //   onPressed: (){}, 
            //   icon: const Icon(Icons.settings,
            //   size: 20,
            //   color: Colors.amberAccent,
            //   ),
            // ),
            child: Image.network("https://images.ctfassets.net/y2ske730sjqp/5QQ9SVIdc1tmkqrtFnG9U1/de758bba0f65dcc1c6bc1f31f161003d/BrandAssets_Logos_02-NSymbol.jpg?w=940",
            width: 120,
            ),
            ),
          ],
        ),
  
        body: ListView.builder(
            itemCount: 1,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 400,
                  ),
                   Column(
                   // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(

                        child:ElevatedButton(
                          onPressed:(){
                          }, 
                          child:const Text(
                            "Pay",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                    "Action Movies",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/en/2/25/Kota_Factory_2_poster.jpg",
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              child: Image.network(
                                "https://m.media-amazon.com/images/M/MV5BMTY1Nzg4MjcwN15BMl5BanBnXkFtZTcwOTc1NTk1OQ@@._V1_.jpg",
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              child: Image.network(
                                "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00310216-tluebxpafx-portrait.jpg",
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              child: Image.network(
                                "https://d2jdgazzki9vjm.cloudfront.net/top10-technologies/images/top-10-netflix-series-of-all-time5.png",
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              child: Image.network(
                                "https://files.delhievents.com/images/events/2017/march/Beauty-Beast-2017-Movie-Poster.jpg",
                              ),
                            ),
                          ],
                        ),
                      ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Netflix Web Series",
                              style: TextStyle(
                                fontSize: 20,
                                 color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),                                ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 300,
                                  width: 200,
                                  child: Image.network(
                                    
                                    "https://www.scrolldroll.com/wp-content/uploads/2021/11/girls-hostel-web-series-on-student-life.jpg"
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 300,
                                  width: 200,
                                  child: Image.network(
                                    "https://www.scrolldroll.com/wp-content/uploads/2023/01/jaanbaaz-hindustan-ke-indian-webseries-in-january-2023.jpg",
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 300,
                                  width: 200,
                                  child: Image.network(
                                    "https://movieassetsdigital.sgp1.cdn.digitaloceanspaces.com/original/5f35b100b2d999ef8cd08be2e27d601c5910e28b",
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 300,
                                  width: 200,
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCH60sV9oyTYoQeveq9UKQ0u_oN0W1Vd55cw&s",
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 300,
                                  width: 200,
                                  child: Image.network(
                                    "https://d2jdgazzki9vjm.cloudfront.net/top10-technologies/images/top-10-netflix-series-in-india4.jpg",
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              );
            } ,
          ),
      ),
    );
  }
}
