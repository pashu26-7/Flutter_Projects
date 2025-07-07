import 'package:flutter/material.dart';

class AboutAgrimartScreen extends StatelessWidget {
  const AboutAgrimartScreen({super.key});

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
          'About Agrimart',
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
              'About Agrimart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Agrimart is a leading e-commerce platform dedicated to serving the agricultural community. '
              'Our mission is to simplify the lives of farmers and agribusinesses by providing easy access to high-quality products, tools, and resources.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              'Our Vision',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'To empower the agricultural community with technology and innovation, making farming efficient and sustainable.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'What We Offer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- A wide range of agricultural tools, machinery, and equipment.\n'
              '- High-quality seeds, fertilizers, and pesticides.\n'
              '- Expert advice and resources to improve farming practices.\n'
              '- Reliable delivery services to ensure timely availability of products.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Why Choose Agrimart?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '- Trusted by thousands of farmers across the country.\n'
              '- Competitive pricing and exclusive offers.\n'
              '- Easy-to-use platform with seamless navigation.\n'
              '- Dedicated customer support to assist with your queries.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our Commitment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Agrimart is committed to fostering a community of empowered farmers by bridging the gap between technology and agriculture. '
              'We strive to make farming more productive and rewarding.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We value your feedback and inquiries. Reach out to us at:\n'
              'Email: support@agrimart.com\n'
              'Phone: +91-XXXXXXXXXX\n'
              'Website: www.agrimart.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


