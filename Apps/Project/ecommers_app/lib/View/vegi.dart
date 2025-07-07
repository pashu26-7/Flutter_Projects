//final////////////
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/cart.dart';
import 'package:ecommers_app/View/inner_product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  _VegetablesState createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

final List<Map<String, dynamic>> vegList1 = [
  {
    'image': 'assets/vegetable/tomato.jpg',
    'title': "Tomato",
    'quantity': "1 kg",
    'rupees': 40.0,
    'description':
        "Tomatoes 🍅: Tomatoes are a versatile fruit that is widely used in Indian cooking. They are rich in vitamin C, antioxidants, and lycopene, which help promote skin health and prevent heart disease. Tomatoes are commonly used in curries, soups, chutneys, and salads. They add a tangy flavor and contribute to the richness of the dish."
  },
  {
    'image': 'assets/vegetable/cauliflower.jpg',
    'title': "Cauliflower",
    'quantity': "1 medium head",
    'rupees': 50.0,
    'description':
        "Cauliflower 🥦: Cauliflower is a cruciferous vegetable known for its white, compact florets. It's rich in vitamins C and K, and has anti-inflammatory properties. In Indian cuisine, it is often used in curries, parathas, and as a side dish. Cauliflower is low in calories, making it an excellent option for weight management."
  },
  {
    'image': 'assets/vegetable/eggplant.jpg',
    'title': "Eggplant",
    'quantity': "1 kg",
    'rupees': 35.0,
    'description':
        "Eggplant 🍆: Eggplants, also known as brinjals, are rich in fiber and antioxidants, and low in calories. They are commonly used in curries, bhartas (smoked and mashed), and stews. Eggplants help regulate blood sugar and support heart health. Their mild flavor and smooth texture make them a popular ingredient in Indian dishes."
  },
  {
    'image': 'assets/vegetable/bottle_gourd.jpg',
    'title': "Bottle Gourd",
    'quantity': "1 medium",
    'rupees': 20.0,
    'description':
        "Bottle Gourd 🥒: Bottle gourd, or Lauki, is a popular vegetable in Indian homes due to its light, refreshing taste and health benefits. It is low in calories, aids digestion, and helps in maintaining a healthy heart. Bottle gourd is commonly used in curries, soups, and juices, and is known for its ability to cool the body."
  },
  {
    'image': 'assets/vegetable/cucumber.jpg',
    'title': "Cucumber",
    'quantity': "1 kg",
    'rupees': 30.0,
    'description':
        "Cucumber 🥒: Cucumbers are hydrating and low in calories, making them a perfect vegetable for summer. They are rich in antioxidants, fiber, and vitamin K, and are commonly used in salads, raitas, and as a garnish. Cucumbers are also known for their cooling effect on the body."
  },
];

final List<Map<String, dynamic>> vegList2 = [
  {
    'image': 'assets/vegetable/green_chili.jpg',
    'title': "Green Chili",
    'quantity': "100 g",
    'rupees': 20.0,
    'description':
        "Green Chili 🌶️: Green chilies are a staple in Indian cuisine, adding heat and flavor to various dishes. They are rich in vitamin C, capsaicin, and antioxidants. Green chilies are used in curries, chutneys, and pickles, and are known to boost metabolism and promote digestion."
  },
  {
    'image': 'assets/vegetable/potato.jpg',
    'title': "Potato",
    'quantity': "1 kg",
    'rupees': 35.0,
    'description':
        "Potato 🥔: Potatoes are one of the most widely consumed vegetables in India. Rich in carbohydrates, fiber, and vitamin C, they provide energy and aid digestion. Potatoes are used in a variety of dishes like sabzis, aloo tikki, and parathas, and are versatile enough to be fried, mashed, or roasted."
  },
  {
    'image': 'assets/vegetable/carrot.jpg',
    'title': "Carrot",
    'quantity': "500 g",
    'rupees': 40.0,
    'description':
        "Carrot 🥕: Carrots are rich in beta-carotene, which is converted into vitamin A, promoting good vision and skin health. They are commonly used in Indian salads, juices, and curries. Carrots are also known for their high fiber content, aiding in digestion and promoting a healthy heart."
  },
  {
    'image': 'assets/vegetable/okra.jpg',
    'title': "Okra",
    'quantity': "1 kg",
    'rupees': 40.0,
    'description':
        "Okra 🍠: Okra, or bhindi, is a nutritious vegetable known for its high fiber content and vitamin C. It is commonly used in stir-fries, curries, and pickles. Okra supports healthy digestion, reduces blood sugar levels, and helps maintain heart health."
  },
  {
    'image': 'assets/vegetable/mushroom.jpg',
    'title': "Mushroom",
    'quantity': "200 g",
    'rupees': 60.0,
    'description':
        "Mushroom 🍄: Mushrooms are a rich source of antioxidants, fiber, and vitamins, including vitamin D. They are commonly used in Indian curries, soups, and stir-fries. Mushrooms help boost the immune system, support heart health, and improve brain function."
  },
];

final List<Map<String, dynamic>> vegList3 = [
  {
    'image': 'assets/vegetable/beans.jpg',
    'title': "Green Beans",
    'quantity': "500 g",
    'rupees': 30.0,
    'description':
        "Green Beans 🌿: Green beans are low in calories and high in fiber, making them a great addition to a healthy diet. They are rich in vitamins A, C, and K, and are often used in curries, stir-fries, or simply sautéed with garlic and mustard seeds in Indian cuisine."
  },
  {
    'image': 'assets/vegetable/peas.jpg',
    'title': "Green Peas",
    'quantity': "500 g",
    'rupees': 40.0,
    'description':
        "Green Peas 🍃: Green peas are an excellent source of vitamins A, B, and C, as well as dietary fiber. They are commonly used in Indian dishes like aloo matar, curries, and pulao. Green peas promote digestion and are known to help lower cholesterol levels."
  },
  {
    'image': 'assets/vegetable/sweet_potato.jpg',
    'title': "Sweet Potato",
    'quantity': "1 kg",
    'rupees': 50.0,
    'description':
        "Sweet Potato 🍠: Sweet potatoes are rich in fiber, antioxidants, and vitamins A and C. They are versatile in cooking and can be used in curries, fries, or even desserts. Sweet potatoes help regulate blood sugar, support gut health, and improve immune function."
  },
  {
    'image': 'assets/vegetable/corn.jpg',
    'title': "Corn",
    'quantity': "500 g",
    'rupees': 30.0,
    'description':
        "Corn 🌽: Corn is a popular vegetable used in a variety of Indian dishes, such as corn and peas pulao, and as a snack. It is rich in fiber, antioxidants, and B vitamins. Corn promotes digestive health and provides energy, making it a great addition to a balanced diet."
  },
  {
    'image': 'assets/vegetable/radish.jpg',
    'title': "Radish",
    'quantity': "500 g",
    'rupees': 20.0,
    'description':
        "Radish 🌶️: Radishes are crunchy root vegetables known for their spicy flavor. They are rich in vitamin C, fiber, and antioxidants. In Indian cuisine, they are often used in salads, raitas, or pickles. Radishes help with detoxification, improve digestion, and support skin health."
  },
];





  List<Map<String, dynamic>> _searchVegetables(
      List<Map<String, dynamic>> vegList) {
    return vegList
        .where((veg) =>
            veg['title'].toLowerCase().contains(_searchQuery) ||
            veg['description'].toLowerCase().contains(_searchQuery))
        .toList();
  }

  Future<void> addToFavorites(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance.collection('favorites').add(item);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Added to wishlist!",
          style: TextStyle(color: Colors.green),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

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

  Widget buildLeafyRow(List<Map<String, dynamic>> vegetableList) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vegetableList.length,
        itemBuilder: (context, index) {
          final item = vegetableList[index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 132,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${item["title"]}\n${item["quantity"]}\n₹${item["rupees"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetails2(
                            title: item['title'],
                            image: item['image'],
                            rupees: item["rupees"],
                            description: item['description'],
                          ),
                        ),
                      );
                      // Implement navigation to product details if needed
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "View product details",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.green,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => addToFavorites(item),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.red.shade600,
                              ),
                            ),
                            const SizedBox(width: 120),
                            GestureDetector(
                              onTap: () async {
                                log("Price: ${item['rupees']}");
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
                                    content: Text("Added to  cart"),
                                    backgroundColor: Colors.green,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Vegetables",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Search for vegetables",
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query.toLowerCase();
                  });
                },
              ),
            ),
            buildLeafyRow(_searchVegetables(vegList1)),
            buildLeafyRow(_searchVegetables(vegList2)),
            buildLeafyRow(_searchVegetables(vegList3)),
          ],
        ),
      ),
    );
  }
}

