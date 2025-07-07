//finnal 
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/View/payment_screen.dart';
import 'package:ecommers_app/View/placeorder.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  Future<void> removeItem(String docId) async {
    await FirebaseFirestore.instance.collection('checkout').doc(docId).delete();
  }

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isHovered = false;
  final List _items = [];

  // Calculate the total MRP including quantities
  double get _totalMRP {
    return _items.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));
  }

  Future<void> getData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("cart").get();
    for (int i = 0; i < response.docs.length; i++) {
      log("${response.docs[i].data()}");
      var singleObj = response.docs[i].data() as Map;
      singleObj['id'] = response.docs[i].id;
      _items.add(singleObj);
    }

    setState(() {});
  }

  Future<void> moveToOrderHistory() async {
    for (var item in _items) {
      await FirebaseFirestore.instance.collection('orderHistory').add({
        'name': item['name'],
        'price': item['price'],
        'quantity': item['quantity'],
        'totalPrice': item['price'] * item['quantity'],
        'orderDate': Timestamp.now(),
      });
    }
    await deleteItemsFromCart();
  }

  Future<void> deleteItemsFromCart() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("cart").get();
    for (int i = 0; i < response.docs.length; i++) {
      await FirebaseFirestore.instance
          .collection("cart")
          .doc(response.docs[i].id)
          .delete();
    }
  }

  void _incrementQuantity(int index, String id) async {
    _items[index]["quantity"] += 1;

    await FirebaseFirestore.instance
        .collection("cart")
        .doc(id)
        .update({"quantity": _items[index]["quantity"]});
    setState(() {});
  }

  void _decrementQuantity(int index, String id) async {
    if (_items[index]["quantity"] > 1) {
      _items[index]["quantity"] -= 1;
      await FirebaseFirestore.instance.collection("cart").doc(id).update(
        {
          "quantity": _items[index]["quantity"],
        },
      );
    } else if (_items[index]["quantity"] == 1) {
      _items.removeAt(index);
      await FirebaseFirestore.instance.collection("cart").doc(id).delete();
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        shadowColor: Colors.black26,
        elevation: 18,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: const Row(
          children: [
            Text(
              "Checkout",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Spacer(),
          ],
        ),
      ),
      body: _items.isEmpty // **Added condition to check if cart is empty**
          ? const Padding(
            padding: EdgeInsets.all(12),
            child: Center( // **Empty cart message UI**
                child: Text(
                  "Your cart is empty! Please add items to proceed.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
          )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => _isHovered = true),
                          onExit: (_) => setState(() => _isHovered = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: _isHovered
                                      ? Colors.grey.withOpacity(0.5)
                                      : Colors.grey.withOpacity(0.3),
                                  spreadRadius: _isHovered ? 8 : 5,
                                  blurRadius: _isHovered ? 10 : 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      item["image"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["name"],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 90,
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 33, 136, 36),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(9)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () => _decrementQuantity(
                                                  index, item["id"]),
                                              child: const Icon(Icons.remove,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "${item["quantity"]}",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => _incrementQuantity(
                                                  index, item["id"]),
                                              child: const Icon(Icons.add,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "₹${(item["price"] * item["quantity"]).toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Footer Section
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Price Details",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        PriceDetailRow(
                          label: 'Total MRP (Inc. Taxes)',
                          price: _totalMRP,
                        ),
                        const Divider(),
                        const PriceDetailRow(
                          label: 'Total Savings',
                          price: 20, // Add savings logic if needed
                        ),
                        const Divider(),
                        PriceDetailRow(
                          label: 'Total Payable',
                          price: _totalMRP,
                        ),
                        const Divider(),
                        GestureDetector(
                          onTap: () async {
                            await moveToOrderHistory();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentScreen(totalPayable: _totalMRP)),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 33, 136, 36),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Click to Proceed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class PriceDetailRow extends StatelessWidget {
  final String label;
  final double price;

  const PriceDetailRow({required this.label, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            "₹${price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


