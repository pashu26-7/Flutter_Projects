import 'package:cloud_firestore/cloud_firestore.dart';

void uploadVegetableData() async {
  final List<Map<String, dynamic>> vegetableData = [
    {
      'title': 'Potato',
      'quantity': '1kg',
      'rupees': 60,
      'image': 'https://example.com/potato.jpg',
      'description': 'Potato 🥔: Versatile in cooking.'
    },
    {
      'title': 'Tomato',
      'quantity': '1kg',
      'rupees': 50,
      'image': 'https://example.com/tomato.jpg',
      'description': 'Tomato 🍅: Juicy and fresh.'
    },
    {
      'title': 'Carrot',
      'quantity': '1kg',
      'rupees': 40,
      'image': 'https://example.com/carrot.jpg',
      'description': 'Carrot 🥕: Crunchy and sweet.'
    },
  ];

  for (var vegetable in vegetableData) {
    await FirebaseFirestore.instance.collection('vegetables').add(vegetable);
  }
  print("Vegetable data uploaded successfully!");
}
