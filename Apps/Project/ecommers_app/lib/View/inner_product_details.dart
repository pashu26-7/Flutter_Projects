import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/View/checkout.dart';
import 'package:flutter/material.dart';

class ProductDetails2 extends StatefulWidget {
  final String? title;
  final String? image;
  final double? rupees;
  // final String? quantity;
  final String? description;

  const ProductDetails2({
    super.key,
    required this.title,
    required this.image,
    required this.rupees,
    // required this.quantity,
    required this.description,
  });

  @override
  State<ProductDetails2> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails2> {
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        centerTitle: true,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Product Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  widget.image!,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Display Product Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 8),

            // Display Product Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '₹${widget.rupees?.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Display Product Quantity
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     'Quantity: ${widget.quantity}',
            //     style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
            //   ),
            // ),
            const SizedBox(height: 16),

            // Display Product Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Description:',
                style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                widget.description!,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  log("Add to cart");

                  QuerySnapshot response =
                      await FirebaseFirestore.instance.collection('cart').get();

                  bool canadd = true;
                  for (int i = 0; i < response.docs.length; i++) {
                    if (response.docs[i]['name'] == widget.title) {
                      canadd = false;
                      return;
                    }
                  }
                  if (canadd) {
                    await FirebaseFirestore.instance.collection('cart').add({
                      'name': widget.title,
                      'price': widget.rupees,
                      'image': widget.image,
                      'quantity': 1,
                    });

                    log("added to cart");

                    setState(() {
                      isAddedToCart = !isAddedToCart;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isAddedToCart
                              ? '${widget.title} added to cart successfully'
                              : '${widget.title} removed from cart successfully',
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAddedToCart ? Colors.red : Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isAddedToCart ? "Remove from Cart" : "Add to Cart",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  log("Add to cart");

                  QuerySnapshot response =
                      await FirebaseFirestore.instance.collection('cart').get();

                  bool canadd = true;
                  for (int i = 0; i < response.docs.length; i++) {
                    if (response.docs[i]['name'] == widget.title) {
                      canadd = false;
                      return;
                    }
                  }
                  if (canadd) {
                    await FirebaseFirestore.instance.collection('cart').add({
                      'name': widget.title,
                      'price': widget.rupees,
                      'image': widget.image,
                      'quantity': 1,
                    });
                    log("added to cart");
                    setState(() {
                      isAddedToCart = !isAddedToCart;
                    });
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const CheckoutScreen();
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Proceeding to buy ${widget.title}')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 3, 75, 7),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
