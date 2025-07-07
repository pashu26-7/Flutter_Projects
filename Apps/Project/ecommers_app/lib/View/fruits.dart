//final
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/cart.dart';
import 'package:ecommers_app/View/inner_product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fruitscreen extends StatefulWidget {
  const Fruitscreen({super.key});

  @override
  _FruitscreenState createState() => _FruitscreenState();
}

class _FruitscreenState extends State<Fruitscreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

    final List<Map<String, dynamic>> combinedList = [
    {
      'image': 'assets/vegitable/aplle.jpg',
      'title': "Apple",
      'quantity': "1 set",
      'rupees': 13.0,
      'description':
          "Apple 🍎:\nApples are one of the most widely consumed fruits worldwide, known for their crisp texture, sweet or tart flavor, and vibrant colors like red, green, and yellow. Rich in essential nutrients like fiber, Vitamin C, and antioxidants, apples are excellent for boosting the immune system, promoting digestion, and supporting heart health. They are a great low-calorie snack and are often enjoyed fresh, juiced, or used in baking and cooking, such as in apple pies, salads, and smoothies. Apples are convenient, versatile, and provide a healthy, refreshing boost to your daily diet.",
    },
    {
      'image': 'assets/vegitable/banana.jpg',
      'title': "Banana",
      'quantity': "2 set",
      'rupees': 14.0,
      'description':
          "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
    },
    {
      'image': 'assets/vegitable/grapes.jpg',
      'title': "Grapes",
      'quantity': "2 set",
      'rupees': 160.0,
      'description': "Apples are nutritious and delicious for every meal.",
    },
    {
      'image': 'assets/vegitable/orrange.jpg',
      'title': "Orange",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Orange 🍊:\nOranges are a popular citrus fruit recognized for their tangy, refreshing flavor and vibrant orange skin. Packed with Vitamin C, antioxidants, and fiber, oranges are perfect for supporting immunity, improving skin health, and enhancing digestion. They are commonly eaten fresh, juiced, or used in cooking and baking to add a burst of flavor. Oranges are an excellent hydrating fruit, rich in nutrients that help maintain overall health and energy levels, making them a go-to choice for a nutritious snack or beverage.",
    },
    {
      'image': 'assets/vegitable/cherry.jpg',
      'title': "Cherry",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Cherry 🍒 :\nCherries are small, round, and vibrant red fruits celebrated for their sweet and tart flavors, juicy flesh, and glossy skin. Packed with essential nutrients, they are an excellent source of Vitamin C, potassium, antioxidants, and dietary fiber. These nutrients contribute to their health benefits, including supporting heart health, reducing inflammation, and promoting better sleep due to their natural melatonin content.Cherries are versatile and widely used in culinary dishes, enjoyed fresh as a snack, or incorporated into desserts like pies, tarts, jams, and cakes. They are also a delightful addition to smoothies, salads, and even savory recipes. Their unique taste, paired with impressive nutritional value, makes cherries a cherished treat worldwide."
    },
  ];

  final List<Map<String, dynamic>> combinedList2 = [
    {
      'image': 'assets/vegitable/pa.jpg',
      'title': "Pineapple",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Pineapple 🍍:\nPineapple is a tropical fruit with spiky, green-topped skin and sweet, tangy yellow flesh. It's rich in Vitamin C, manganese, and bromelain, an enzyme known for its anti-inflammatory and digestion-aiding properties. Pineapples are commonly enjoyed fresh, in juices, grilled as a dessert, or used in savory dishes like stir-fries and pizzas.",
    },
    {
      'image': 'assets/vegitable/stwabery.jpg',
      'title': "Strawbery",
      'quantity': "2 set",
      'rupees': 110.50,
      'description':
          " Strawberry 🍓:\nStrawberries are bright red, juicy fruits with a sweet flavor and distinctive aroma. They are loaded with Vitamin C, manganese, antioxidants, and dietary fiber. Strawberries support heart health, improve skin quality, and boost immunity. They are enjoyed fresh, in desserts like shortcakes, as toppings for cereals, or blended into smoothies.",
    },
    {
      'image': 'assets/vegitable/mango.jpg',
      'title': "Mango",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          " Mango 🥭:\nMango, the 'king of fruits', is a tropical favorite with juicy, golden-yellow flesh and a sweet, aromatic flavor. It’s a rich source of Vitamin C, Vitamin A, and antioxidants that promote eye health and boost immunity. Mangoes can be enjoyed fresh, made into juices, added to desserts, or used in savory dishes like chutneys."
    },
    {
      'image': 'assets/vegitable/ca.jpg',
      'title': "Custordapple",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          " Custard Apple 🍈:\nCustard apple, also known as sitaphal, is a creamy, sweet fruit with green, bumpy skin and soft, white flesh. It’s high in Vitamin C, potassium, and dietary fiber, promoting heart health and aiding digestion. Custard apples are often eaten fresh by scooping out the flesh and are also used in desserts like ice creams and milkshakes.",
    },
    {
      'image': 'assets/vegitable/avacoda1.jpg',
      'title': "Avacoda",
      'quantity': "2 set",
      'rupees': 180.0,
      'description':
          " Avocado 🥑\nAvocado is a creamy, nutrient-dense fruit with a green, leathery skin and soft, buttery flesh. It's rich in healthy monounsaturated fats, Vitamin E, potassium, and fiber, making it great for heart health and skin. Avocados are versatile and can be used in salads, spreads like guacamole, smoothies, or eaten plain with a sprinkle of salt and pepper.",
    },
  ];

  final List<Map<String, dynamic>> combinedList3 = [
    {
      'image': 'assets/vegitable/wat.jpg',
      'title': "Watermelon",
      'quantity': "1 set",
      'rupees': 70.0,
      'description':
          "Watermelon 🍉:\nWatermelon is a large, refreshing fruit known for its green rind and juicy red or pink interior filled with black seeds. It's composed of over 90% water, making it an excellent choice for hydration on hot days. Watermelons are rich in vitamins A and C, antioxidants, and lycopene, which supports heart health and reduces inflammation. They are often eaten fresh, blended into smoothies, or served in fruit salads."
    },
    {
      'image': 'assets/vegitable/musk.jpg',
      'title': "Muskmelon",
      'quantity': "2 set",
      'rupees': 60.0,
      'description':
          " Muskmelon 🍈:\nMuskmelon, also known as cantaloupe, is a sweet and fragrant fruit with orange flesh and a netted tan skin. It is a good source of vitamins A and C, potassium, and dietary fiber. Muskmelons are known for their cooling and hydrating properties, making them ideal for summer. They can be eaten as a snack, added to desserts, or used in smoothies and salads."
    },
    {
      'image': 'assets/vegitable/kivi.jpg',
      'title': "Kivi",
      'quantity': "2 set",
      'rupees': 160.0,
      'description':
          "Kiwi 🥝:\nKiwi is a small, oval-shaped fruit with fuzzy brown skin and vibrant green flesh dotted with tiny black seeds. Known for its tangy-sweet flavor, it is a powerhouse of nutrients, including Vitamin C, Vitamin K, and dietary fiber. Kiwi boosts immunity, aids digestion, and supports skin health. It’s enjoyed fresh, in fruit salads, as a topping for desserts, or blended into smoothies."
    },
    {
      'image': 'assets/vegitable/berry.jpg',
      'title': "Berry",
      'quantity': "1 set",
      'rupees': 65.25,
      'description':
          " Berry (Mixed) 🍓🫐:\nBerries like strawberries, blueberries, and blackberries are small, juicy, and flavorful. They are packed with antioxidants, vitamins, and dietary fiber, offering numerous health benefits such as improved brain function, better digestion, and reduced inflammation. Berries are versatile and can be eaten fresh, added to cereals, baked into desserts, or used in smoothies."
    },
    {
      'image': 'assets/vegitable/papaya.jpg',
      'title': "Papaya",
      'quantity': "2 set",
      'rupees': 80.7,
      'description':
          "Papaya 🧡:\nPapaya is a tropical fruit with orange flesh, black seeds, and green or yellow skin. Known for its natural sweetness, it is rich in Vitamin C, Vitamin A, and papain, an enzyme that aids digestion. Papayas are great for boosting immunity, improving skin health, and supporting gut health. They can be eaten fresh, added to fruit salads, or used in desserts and juices."
    },
  ];


  List<Map<String, dynamic>> _searchFruits(
      List<Map<String, dynamic>> fruitList) {
    return fruitList
        .where((fruit) =>
            fruit['title'].toLowerCase().contains(_searchQuery) ||
            fruit['description'].toLowerCase().contains(_searchQuery))
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

  Widget buildFruitRow(List<Map<String, dynamic>> fruitList) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:fruitList.length,
        itemBuilder: (context, index) {
          final item =fruitList[index];
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
          " Fruits",
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
            buildFruitRow(_searchFruits(combinedList)),
            buildFruitRow(_searchFruits(combinedList2)),
            buildFruitRow(_searchFruits(combinedList3)),

          ],
        ),
      ),
    );
  }
}
