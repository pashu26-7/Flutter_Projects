
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  // Fetch the order history from Firestore
  Future<List<QueryDocumentSnapshot>> fetchOrderHistory() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('orderHistory').get();
    return querySnapshot.docs;
  }

  // Function to remove an order from Firestore
  Future<void> removeOrder(String docId) async {
    await FirebaseFirestore.instance
        .collection('orderHistory')
        .doc(docId)
        .delete();
    setState(() {}); // Refresh the UI after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        title: const Text(
          "Order History",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: fetchOrderHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found.'));
          }

          List<QueryDocumentSnapshot> orders = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final orderData = order.data() as Map<String, dynamic>;

              return Dismissible(
                key: Key(order.id), // Unique key for each item
                direction: DismissDirection.endToStart, // Swipe from right to left
                onDismissed: (direction) async {
                  // Remove the order from Firestore
                  await removeOrder(order.id);

                  // Show a snackbar as feedback
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order removed successfully.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Date: ${orderData['orderDate'].toDate().toString()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Name: ${orderData['name']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Price: ₹${orderData['price']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Quantity: ${orderData['quantity']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Total Price: ₹${orderData['totalPrice']}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

