import 'package:amazon_shopping/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Home_SerachPage(), 
    );
  }
}
class Home_SerachPage extends StatefulWidget {
  const Home_SerachPage({super.key});

  @override
  State<Home_SerachPage> createState() => _Home_SearchPageState();
}

class _Home_SearchPageState extends State<Home_SerachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: GestureDetector(
            
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context)=> const Search_Page(),
              ),
              );
            },
            child: Container(
              height: 35,
              //width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black87,
                  width: 1.4,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  ),
                  child:  Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: BorderSide.strokeAlignCenter
                        ),
                      child: IconButton(
                        onPressed:(){
                                      
                        }, 
                        icon: const Icon(
                          Icons.search,
                          ),
                        ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Search or ask a question",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:Colors.black87,
                    ),),
                  ],
                  ),
            ),
          ),
           
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 410,
                height: 40,
                color: Colors.yellowAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: [
                     IconButton(
                      onPressed: (){
                      }, 
                      icon: const Icon(
                        Icons.location_on,
                      ),
                    ),
                    const Text(
                      "Deliver to Prashant-Pune 411041",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:13,
                      ),
                    ),
                    const SizedBox(
                      //width:1,
                    ),
                    IconButton(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 100,
              // child: Row(
              //   children: [
              //    // Image.network("https://akm-img-a-in.tosshub.com/businesstoday/images/story/202309/untitled_-_2023-09-26t192219-sixteen_nine.jpg?size=948:533"),
              //   ],
              // ),
            ),
          ],
        ),
      );
  }
}


