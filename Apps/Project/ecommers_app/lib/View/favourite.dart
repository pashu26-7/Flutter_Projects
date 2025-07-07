import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/cart.dart';
import 'package:ecommers_app/View/checkout.dart';
import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite(
      {super.key, required List<Map<String, String>> favoriteItems});
      Future<void> addToCart(CartItem item) async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('cart').get();
    for (int i = 0; i < response.docs.length; i++) {
      if (response.docs[i]['name'] == item.title) {
        return;
      }
    }
    await FirebaseFirestore.instance.collection('cart').add({
      'name': item.title,
      'price': item.price,
      'image': item.image,
      'quantity': 1,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.5),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.keyboard_backspace_outlined,
              color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ),
          )
        ],
     backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        title: const Text(
          "My Wishlist",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('favorites').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data!'));
          }

          final favoriteItems = snapshot.data?.docs ?? [];
          if (favoriteItems.isEmpty) {
            return const Center(
                child: Text('Your wishlist is empty!',
                    style: TextStyle(fontSize: 18, color: Colors.grey)));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favoriteItems[index].data() as Map<String, dynamic>;
              final docId = favoriteItems[index].id;

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        child: Image.asset(
                          item['image'] ?? 'assets/vegitable/bluebell.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] ?? 'No description available',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${item['rupees'] ?? '0'}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              IconButton(
                                
                                icon: const Icon(Icons.add_shopping_cart),
                                color: Colors.green,
                                onPressed: ()async {    
                                // log("Price: ${item['rupees']}");
                                CartItem cartItem = CartItem(
                                  title: item['title'],
                                  image: item['image'],
                                  price: item["rupees"],
                                  description: item['description'],
                                  quantity:
                                      1, // You can modify this if you allow quantity adjustments
                                );
                                await addToCart(cartItem);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Added to cart!",
                                          style:
                                              TextStyle(color: Colors.green)),
                                      duration: Duration(seconds: 7),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              await FirebaseFirestore.instance
                                  .collection('favorites')
                                  .doc(docId)
                                  .delete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Removed from wishlist!",
                                      style: TextStyle(color: Colors.red)),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.close, size: 16, color: Colors.red),
                                SizedBox(width: 5),
                                Text("Remove",
                                    style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
