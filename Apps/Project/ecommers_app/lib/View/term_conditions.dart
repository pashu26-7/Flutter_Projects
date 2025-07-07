import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

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
          'Terms and Conditions',
          style: TextStyle(
            fontSize: 25,
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
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Agrimart! By using our platform, you agree to abide by the following terms and conditions. Please read them carefully.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              '1. User Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Users must provide accurate and complete information during registration.\n'
              '- You are responsible for maintaining the confidentiality of your account credentials.\n'
              '- Agrimart reserves the right to terminate accounts for misuse or violation of terms.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '2. Product and Service Availability',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Products and services are subject to availability and may vary by location.\n'
              '- Agrimart reserves the right to modify, discontinue, or limit product availability without prior notice.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '3. Pricing and Payment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- All prices are displayed in Indian Rupees (INR) and include applicable taxes unless stated otherwise.\n'
              '- Payments must be made through the accepted methods on our platform.\n'
              '- Agrimart is not responsible for payment gateway errors or delays.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '4. Returns and Refunds',
              style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Returns are accepted only for eligible products within the specified return window.\n'
              '- Refunds will be processed according to our refund policy and may take up to 7 business days.\n'
              '- Items must be returned in their original condition with all accessories and packaging.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '5. Intellectual Property',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- All content on Agrimart, including text, images, and logos, is protected by copyright laws.\n'
              '- Users are prohibited from reproducing, distributing, or modifying any content without prior permission.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '6. Limitation of Liability',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Agrimart is not liable for any indirect, incidental, or consequential damages arising from the use of our platform.\n'
              '- We make no warranties regarding product suitability, accuracy, or availability.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '7. Modifications to Terms',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Agrimart reserves the right to update these terms at any time without prior notice.\n'
              '- Continued use of our platform constitutes acceptance of the updated terms.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '8. Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions about these terms, please contact us:\n'
              'Email: support@agrimart.com\n'
              'Phone: +91-XXXXXXXXXX\n'
              'Website: www.agrimart.com',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
