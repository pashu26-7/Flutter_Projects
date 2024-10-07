import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Shoes_cart extends StatefulWidget {
  const Shoes_cart({super.key});

  @override
  State<Shoes_cart> createState() => _Shoes_cartState();
}

class _Shoes_cartState extends State<Shoes_cart> {
  int num1 = 0;
  int num2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My cart",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 29,
                      child: Container(
                        child: const Text(
                          "Nike Shoes",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: const SizedBox(
                        width: 250,
                        child: Text(
                          "with iconic style and legendary confort, on repeat.",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Row(
                        children: [
                          Container(
                            //width: 100,
                            child: const Text(
                              "570.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                if (num1 <= 0) {
                                  num1++;
                                }
                                num1--;
                                setState(() {});
                              },
                              child: Container(
                                child: const Icon(Icons.remove),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Container(
                            height: 25,
                            width: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "$num1",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                num1++;
                                setState(() {});
                              },
                              child: Container(
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 235, 232, 232),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 29,
                      child: Container(
                        child: const Text(
                          "Nike Shoes",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: const SizedBox(
                        width: 250,
                        child: Text(
                          "with iconic style and legendary confort, on repeat.",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Row(
                        children: [
                          Container(
                            //width: 100,
                            child: const Text(
                              "77.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                if (num2 <= 0) {
                                  num2++;
                                }
                                num2--;
                                setState(() {});
                              },
                              child: Container(
                                child: const Icon(Icons.remove),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Container(
                            height: 25,
                            width: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "$num2",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                num2++;
                                setState(() {});
                              },
                              child: Container(
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 250,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: const Text(
                      "Subtotal : ",
                      style: TextStyle(
                         fontSize: 17,
                    fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: const Text(
                      "800.00",
                      style: TextStyle(
                        fontSize: 17,
                    fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
            Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                child: const Text(
                  "Delivery Fee : ",
                  style: TextStyle(
                     fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 150,
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: const Text(
                  "05.00",
                  style: TextStyle(
                   fontSize: 17,
                   fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
         const SizedBox(
            height: 10,
          ),
            Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                child: const Text(
                  "Discount : ",
                  style: TextStyle(
                     fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 150,
                height: 35,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: const Text(
                  "40%",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
         const SizedBox(
            height: 30,
          ),
          SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                   style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 100, 28, 187),
                      ),
                      ),
                  onPressed: (){}, 
                  child: const Text(
                    "Checkout for ₹480.00",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  ),
              ),
        ],
      ),
    );
  }
}
