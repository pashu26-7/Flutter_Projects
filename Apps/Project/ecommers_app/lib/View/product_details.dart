import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final String description;

  const ProductDetails({
    super.key,
    this.name = "potato",
    this.image = "assets/pot.jpg",
    this.price = 40.0,
    this.description = "The Fresh indian Potato from Maharashtra",
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.asset(
              widget.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            const Text(
              "product_name"
            ),

            // Product Name and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text("product_prize"),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                '₹${widget.price}',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Product Description
            const Text("Product_description"),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),

            // Quantity Selector
            const Text("Select_Quantity to buy "),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  const Text(
                    "Quantity:",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity = quantity + 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Add to Cart functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.name} added to cart succesfully ($quantity)',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
