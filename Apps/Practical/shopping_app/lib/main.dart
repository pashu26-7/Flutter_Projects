
import 'package:flutter/material.dart';
import 'package:shopping_app/cart.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shopping_Shoes(),
    );
  }
}

class Shopping_Shoes extends StatefulWidget {
  const Shopping_Shoes({super.key});

  @override
  State<Shopping_Shoes> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Shopping_Shoes> {
  int num =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: const Text(
          "Shoes",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 100, 28, 187),
          ),
         ),
         actions: [
          IconButton(
            onPressed: (){
                Navigator.push(
                context, MaterialPageRoute(
                  builder: (context)=> const Shoes_cart(),
              ),
            );
            },
            icon: const Icon(Icons.shopping_cart,
            color: Color.fromARGB(255, 100, 28, 187),
            
            ),
            ),
         ],
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              child: Image.network("https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",
              fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
           const  Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Nike Air Force 1 ''07",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold, 
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 105,
                   child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 100, 28, 187)
                      ),
                      ),
                     onPressed: (){
                   }, child: 
                   const Text(
                     "SHOES",
                     style: TextStyle(
                       fontSize: 15,
                       fontWeight:FontWeight.bold,
                       color:Colors.white,
                     ),
                     ),
                   ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   SizedBox(
                    height: 30,
                    width: 135,
                   child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 100, 28, 187)
                        ),
                        ),
                     onPressed: (){
                   }, child: 
                   const Text(
                     "FOOTWARE",
                     style: TextStyle(
                       fontSize: 15,
                       fontWeight:FontWeight.bold,
                       color:Colors.white,
                     ),
                   ),
                   ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
               "with iconic style and legendary confort,the AF-1 was made to be worn on repeat.hkhjkghjg gdshgajGDHJGHJDGSGH HGsddsgDGSgd ghJSGDHGGGanmnbacgaag haacjgggajbnmacghhcmbj",
               style: TextStyle(
                 fontSize: 15,
                 fontWeight: FontWeight.w500,
                 color: Color.fromARGB(255, 100, 28, 187),
               ),
              ),
            ),
           const SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                 child:const Text(
                    "Quantity",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
               ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: (){
                    if(num<=0){
                      num++;
                    }
                    num--;
                    setState(() {

                    }
                    );
                  },
                  child: Container(
                    child:  const Icon(
                    Icons.remove
                  ),
                ),
                ),
                 const SizedBox(
                  width: 10,
                ),
               Container(
                height: 30,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                 // boxShadow: 
                ),
                child: Text(
                  "$num",
                ),
               ),
                const SizedBox(
                  width: 10,
                ),
               GestureDetector(
                onTap: () {
                  num++;
                  setState(() {
                    
                  }
                  );
                },
                
                child: Container(
                  child: const Icon(
                    Icons.add
                  ),
                ),
               ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 40,
                width: 400,
                child: ElevatedButton(
                   style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 100, 28, 187),
                      ),
                      ),
                  onPressed: (){}, 
                  child: const Text(
                    "PURCHASE",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  ),
              ),
            ),
          ],
        ),
      );
  }
}