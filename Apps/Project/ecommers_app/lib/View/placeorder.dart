
import 'package:ecommers_app/View/ordersuccess.dart';
import 'package:flutter/material.dart';

var finalPrice;

class PaymentScreen extends StatefulWidget {
   final double totalPayable;
  const PaymentScreen({super.key, required this.totalPayable});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod; // To track selected payment method

  final List<Map<String, dynamic>> paymentOptions = [
    {
      'icon': Icons.account_balance,
      'title': "Net Banking",
      'subtitle': "Pay directly from your bank account",
    },
    {
      'icon': Icons.money,
      'title': "Cash on Delivery",
      'subtitle': "Pay with cash upon delivery",
    },
    {
      'icon': Icons.qr_code_scanner,
      'title': "UPI",
      'subtitle': "Pay using any UPI app",
    },
    {
      'icon': Icons.credit_card,
      'title': "Credit/Debit Card",
      'subtitle': "Pay securely using your card",
    },
    {
      'icon': Icons.mobile_friendly,
      'title': "Mobile Wallets",
      'subtitle': "Pay via Paytm, PhonePe, or similar apps",
    },
  ];

  void _placeOrder() {
    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a payment method before placing the order."),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderSuccessScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payments",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Continued Payment with: ${_selectedPaymentMethod ?? 'None'}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Net Banking, UPI, Wallets, and More!",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
               " Total Amount ₹${widget.totalPayable.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: paymentOptions.length,
                itemBuilder: (context, index) {
                  final option = paymentOptions[index];
                  return _buildPaymentOption(
                    icon: option['icon'],
                    title: option['title'],
                    subtitle: option['subtitle'],
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _placeOrder,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "PLACE ORDER",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: const Color.fromARGB(255, 8, 154, 73),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: Icon(
          Icons.check_circle,
          size: 20,
          color: _selectedPaymentMethod == title ? Colors.green : Colors.grey,
        ),
        onTap: () {
          setState(() {
            _selectedPaymentMethod = title;
          });
        },
      ),
    );
  }
}
