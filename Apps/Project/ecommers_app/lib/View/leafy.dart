import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/cart.dart';
import 'package:ecommers_app/View/inner_product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Leaf extends StatefulWidget {
  const Leaf({super.key});

  @override
  _LeafState createState() => _LeafState();
}

class _LeafState extends State<Leaf> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, dynamic>> vegList1 = [
    {
      'image': 'assets/vegitable/spina.jpg',
      'title': "Spinach",
      'quantity': "1 set",
      'rupees': 13.0,
      'description':
          "Spinach 🌿:\nSpinach is a nutrient-dense leafy green known for its versatility in cooking. It is rich in iron, vitamins, and antioxidants, making it a popular choice for a healthy diet. Spinach can be eaten raw in salads, blended into smoothies, or cooked in soups and stews. It is low in calories and packed with vitamins A, C, and K, along with folate and calcium. Spinach is also known to support eye health, boost the immune system, and improve digestion."
    },
    {
      'image': 'assets/vegitable/kale.jpg',
      'title': "Kale",
      'quantity': "2 set",
      'rupees': 14.0,
      'description':
          "Kale 🌿:\nKale is a leafy green vegetable that has gained popularity due to its rich nutritional profile. It is high in fiber, antioxidants, and a variety of vitamins, particularly A, C, and K. Kale can be used in salads, sautéed, or added to soups for a nutritious boost. This cruciferous vegetable is known to support heart health, reduce inflammation, and promote bone health. Kale is also a great source of calcium and potassium."
    },
    {
      'image': 'assets/vegitable/swiss chard.jpg',
      'title': "Swiss Chard",
      'quantity': "2 set",
      'rupees': 160.0,
      'description':
          "Swiss Chard 🍃:\nSwiss Chard is a leafy green vegetable known for its colorful stems and dark, tender leaves. Rich in vitamins A, C, and K, it is a powerful antioxidant. Swiss chard is known for its ability to promote heart health, improve digestion, and provide anti-inflammatory benefits. It can be sautéed, steamed, or used in salads. The nutrient-rich leaves are also a great source of magnesium and iron, making it a staple in plant-based diets."
    },
    {
      'image': 'assets/vegitable/sorrel.jpg',
      'title': "Sorrel",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Sorrel 🌿:\nSorrel is a sour-tasting leafy green used in culinary dishes for its tangy flavor. High in vitamin C and antioxidants, sorrel has numerous health benefits, including supporting immune function and aiding digestion. Sorrel can be used in soups, salads, and sauces, and its distinct sour taste is often used to balance rich or fatty foods. It is also known for its anti-inflammatory and diuretic properties."
    },
    {
      'image': 'assets/vegitable/grapes.jpg',
      'title': "Grapes Leaves",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Grapes Leaves 🍇:\nGrapes leaves are often used in Mediterranean cuisine for wrapping foods like dolma (stuffed grape leaves). They are high in antioxidants and nutrients like vitamins A, C, and K. When cooked, grape leaves take on a tender texture and can be a healthy addition to wraps, salads, and stews. Rich in fiber, they support digestive health and help regulate blood sugar levels."
    },
  ];

  final List<Map<String, dynamic>> vegList2 = [
    {
      'image': 'assets/vegitable/orach1.jpg',
      'title': "Orach",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Orach 🌱:\nOrach, also known as mountain spinach, is a vibrant leafy green with red, green, or purple leaves. It is a rich source of vitamin C, potassium, and iron. Orach can be eaten raw in salads or cooked like spinach. This versatile vegetable has a slightly tangy taste and is known for its ability to support healthy digestion and improve heart health."
    },
    {
      'image': 'assets/vegitable/cab.jpg',
      'title': "Cabbage",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Cabbage 🥬:\nCabbage is a widely cultivated leafy vegetable known for its round, tightly packed leaves. It is an excellent source of dietary fiber, vitamins C and K, and folate. Cabbage is versatile in cooking and can be eaten raw in salads, fermented in dishes like sauerkraut, or cooked in soups and stir-fries. It is also known for its cancer-fighting properties and ability to improve gut health."
    },
    {
      'image': 'assets/vegitable/perila1.jpg',
      'title': "Perilla",
      'quantity': "2 set",
      'rupees': 160.0,
      'description':
          "Perilla 🍃:\nPerilla, also known as shiso, is a flavorful leafy herb widely used in Asian cuisine. It is rich in antioxidants, vitamins, and omega-3 fatty acids. Perilla leaves are used in salads, as a garnish, or in stir-fries. Known for its distinct flavor, perilla has anti-inflammatory properties and can promote brain health and improve circulation."
    },
    {
      'image': 'assets/vegitable/chaya.jpg',
      'title': "Chaya",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Chaya 🌿:\nChaya is a tropical leafy green often referred to as the 'tree spinach.' It is high in vitamins A, C, and K and is often used in cooking for its mild, spinach-like taste. Chaya is packed with calcium and iron, making it an excellent choice for bone health. It is typically cooked before consumption, as raw chaya contains toxic compounds that are removed during cooking."
    },
    {
      'image': 'assets/vegitable/tat.jpg',
      'title': "Tatsoi",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Tatsoi 🌿:\nTatsoi is a type of Asian leafy green that is known for its dark, smooth leaves and mild, mustard-like flavor. It is rich in vitamins A, C, and K, as well as calcium and iron. Tatsoi is commonly used in salads, soups, and stir-fries. It is known for its health benefits, including boosting the immune system and promoting healthy digestion."
    },
  ];

  final List<Map<String, dynamic>> vegList3 = [
    {
      'image': 'assets/vegitable/endive1.jpg',
      'title': "Endive",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Endive 🌿:\nEndive is a leafy vegetable with a slightly bitter flavor, commonly used in salads and as a garnish. It is rich in vitamins A and K and is a great source of fiber. Endive is often paired with sweet ingredients to balance its bitterness. It promotes digestion and is known for its anti-inflammatory properties, making it a healthy addition to any meal."
    },
    {
      'image': 'assets/vegitable/bok.jpg',
      'title': "Bok Choy",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Bok Choy 🥬:\nBok Choy, also known as Chinese cabbage, is a popular vegetable in Asian cuisine. It has tender white stalks and dark green leaves, which are rich in vitamins A, C, and K. Bok choy is used in stir-fries, soups, and salads. It is known for its cancer-fighting properties and its ability to support bone health and improve immune function."
    },
    {
      'image': 'assets/vegitable/mustard green.jpg',
      'title': "Mustard Greens",
      'quantity': "2 set",
      'rupees': 160.0,
      'description':
          "Mustard Greens 🌱:\nMustard greens are a leafy vegetable with a sharp, peppery flavor. They are rich in vitamins A, C, and K, and provide high levels of calcium, iron, and fiber. Mustard greens are often used in Southern and Asian cooking, either sautéed or in soups. They help promote healthy digestion, reduce cholesterol, and support cardiovascular health."
    },
    {
      'image': 'assets/vegitable/bl.jpg',
      'title': "Butterhead Lettuce",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Butterhead Lettuce 🥬:\nButterhead lettuce is known for its soft, tender leaves and mild flavor. It is an excellent source of vitamins A and K, and provides a good amount of folate and fiber. Butterhead lettuce is commonly used in salads and sandwiches. It is hydrating and can aid in digestion, making it a refreshing and healthy option."
    },
    {
      'image': 'assets/vegitable/miz.jpg',
      'title': "Mizuna",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Mizuna 🌱:\nMizuna is a leafy green with a slightly peppery taste, often used in salads, soups, and stir-fries. It is rich in vitamins A, C, and K and has a good amount of calcium and iron. Mizuna is low in calories and provides a boost to the immune system, improves circulation, and supports healthy digestion."
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
                                // Navigator.of(context).push(
                                //    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                                //      );
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
          "Leafy Vegetables",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 25,
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
                  hintText: "Search for Leafy",
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
