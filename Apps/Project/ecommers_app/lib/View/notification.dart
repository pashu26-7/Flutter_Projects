import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map> notifications = [
    {
      "title": "Order Shipped",
      "description": "Your order #12345 has been shipped.",
      "time": "2 hours ago"
    },
    {
      "title": "Payment Successful",
      "description": "Payment of ₹450 was successful.",
      "time": "Yesterday"
    },
    {
      "title": "Offer Alert",
      "description": "Get 20% off on your next purchase!",
      "time": "2 days ago"
    },
    {
      "title": "Delivery Update",
      "description": "Your order #12345 is out for delivery.",
      "time": "3 days ago"
    },
    {
      "title": "New Product Launch",
      "description": "Check out the latest arrivals in vegetables.",
      "time": "5 days ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor:const Color.fromARGB(255, 33, 136, 36),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notifications[index]['title'],
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  notifications[index]['description'],
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notifications[index]['time'],
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              notifications.removeAt(index); // Remove the notification
                            });
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.blue.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
