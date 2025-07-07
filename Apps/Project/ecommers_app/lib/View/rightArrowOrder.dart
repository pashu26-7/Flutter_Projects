import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Right_arrow_order extends StatefulWidget {
  const  Right_arrow_order({super.key});

  @override
  State <Right_arrow_order> createState() =>  Right_arrow_orderState();
}

class Right_arrow_orderState extends State <Right_arrow_order> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5
                ),
                child: Container(
                  //alignment: Alignment.center,
                  height: 40,
                  width: 450,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Order ID : OD332782074083837100",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
            height: 165,
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 100,
                  padding: const EdgeInsets.only(left: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: const Image(
                    image: AssetImage("assets/img12.jpeg"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "The Fresh Indian Potato from Maharashtra from Newasa",
                          style: GoogleFonts.quicksand(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            //color: Colors.pinkAccent),
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          "Seller: SuperComNet",
                          style: GoogleFonts.quicksand(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            //color: Colors.pinkAccent),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text(
                          "₹335",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            //color: Colors.pinkAccent),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
                height: 20,
              ),
           Container(
             alignment: Alignment.center,
             height: 40,
             width: 450,
             color: Colors.white,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Image.asset("assets/speech.jpg"),
                 Text(
                   "Chat with us",
                   style: GoogleFonts.quicksand(
                     fontSize: 15,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ],
             ),
           ),
            ],
          ),
        ],
      )
    );
  }
}