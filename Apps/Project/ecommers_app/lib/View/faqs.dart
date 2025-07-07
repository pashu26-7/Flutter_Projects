import 'package:flutter/material.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'FAQs',
          style: TextStyle(
            fontSize:24,
            fontWeight: FontWeight.bold,
          
          color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        elevation: 4.0,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions (FAQs)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '1. What is Agrimart?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Agrimart is an e-commerce platform specializing in agricultural products, tools, and supplies. We aim to make farming more efficient by providing access to quality products at competitive prices.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '2. How do I place an order on Agrimart?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You can place an order by creating an account, browsing the products, adding items to your cart, and proceeding to checkout. Choose your preferred payment method and confirm your order.',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '3. What payment methods are accepted?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Agrimart accepts various payment methods, including credit/debit cards, UPI, net banking, and cash on delivery (COD) for select locations.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '4. Can I track my order?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Yes, you can track your order through the "My Orders" section in your account. You will also receive updates via email and SMS.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '5. What is the return policy?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Agrimart offers a return policy for eligible products. You can request a return within the specified time frame if the product is defective or damaged.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '6. How do I contact customer support?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You can contact our customer support team via email at support@agrimart.com or call us at +91-XXXXXXXXXX. Our team is available to assist you with any queries.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '7. Is there a mobile app for Agrimart?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Yes, Agrimart has a mobile app available for download on both Android and iOS platforms. The app provides a seamless shopping experience and exclusive offers.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '8. How do I cancel an order?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'To cancel an order, visit the "My Orders" section and select the order you want to cancel. Click on "Cancel Order" and follow the instructions. Cancellations are subject to terms and conditions.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '9. Are there any membership benefits?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Yes, Agrimart offers a membership program that includes exclusive discounts, early access to sales, and free delivery on eligible orders.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '10. Is my personal information safe with Agrimart?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Absolutely. Agrimart prioritizes your privacy and uses encryption to protect your data. Refer to our Privacy Policy for more details.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}


