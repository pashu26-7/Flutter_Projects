
//final
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/cart.dart';
import 'package:ecommers_app/View/inner_product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pesticide extends StatefulWidget {
  const pesticide({super.key});

  @override
  _pesticideState createState() => _pesticideState();
}

class _pesticideState extends State<pesticide> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

final List<Map<String, dynamic>> pesticideList1 = [
  {
    'image': 'assets/pesticide/Endosulfan.jpg',
    'title': "Endosulfan",
    'quantity': "1 L",
    'rupees': 120.0,
    'description':
        "Endosulfan: Endosulfan is a widely used organochlorine insecticide that targets a variety of pests such as aphids, beetles, and caterpillars. It is known for its effectiveness in cotton, vegetables, and fruit crops. However, it is considered toxic and must be used with caution due to its environmental and health risks."
  },
  {
    'image': 'assets/pesticide/Monocrotophos.jpg',
    'title': "Monocrotophos",
    'quantity': "500 ml",
    'rupees': 150.0,
    'description':
        "Monocrotophos: Monocrotophos is a systemic organophosphate insecticide, effective against pests like aphids, whiteflies, and leafhoppers. It is commonly used in crops such as cotton, paddy, and vegetables. Its use should be limited to avoid resistance build-up and minimize human exposure."
  },
  {
    'image': 'assets/pesticide/Chlorpyrifos.jepg',
    'title': "Chlorpyrifos",
    'quantity': "1 L",
    'rupees': 200.0,
    'description':
        "Chlorpyrifos: Chlorpyrifos is a widely used insecticide for controlling soil insects, as well as pests on crops like rice, sugarcane, and vegetables. It works by inhibiting the pest's nervous system. Chlorpyrifos is effective against termites, weevils, and a range of other pests."
  },
  {
    'image': 'assets/pesticide/Cypermethrin.jpg',
    'title': "Cypermethrin",
    'quantity': "500 ml",
    'rupees': 180.0,
    'description':
        "Cypermethrin: Cypermethrin is a synthetic pyrethroid insecticide that is commonly used in the control of pests like flies, mosquitoes, and cockroaches. It is used in both agricultural and domestic settings. It is safe for plants but toxic to aquatic life, so caution is required when applying near water bodies."
  },
  {
    'image': 'assets/pesticide/Emamectin Benzoate.jpg',
    'title': "Emamectin Benzoate",
    'quantity': "200 g",
    'rupees': 250.0,
    'description':
        "Emamectin Benzoate: Emamectin Benzoate is a highly effective pesticide used to control pests such as caterpillars and leaf miners on crops like cotton, vegetables, and fruits. It works by disrupting the pest's nervous system and is relatively safe for beneficial insects like bees when used correctly."
  },
];

final List<Map<String, dynamic>> pesticideList2 = [
  {
    'image': 'assets/pesticide/Imidacloprid.jpg',
    'title': "Imidacloprid",
    'quantity': "500 ml",
    'rupees': 230.0,
    'description':
        "Imidacloprid: Imidacloprid is a systemic insecticide used to control pests like whiteflies, rootworms, and termites. It is effective in crops such as cotton, paddy, and vegetables. Imidacloprid works by interfering with the insect's nervous system. It is effective even at low concentrations, but should be used carefully to avoid harm to pollinators."
  },
  {
    'image': 'assets/pesticide/Thiamethoxam.jpg',
    'title': "Thiamethoxam",
    'quantity': "250 g",
    'rupees': 300.0,
    'description':
        "Thiamethoxam: Thiamethoxam is a neonicotinoid pesticide used for controlling sucking pests like aphids, whiteflies, and leafhoppers. It is commonly used on crops such as maize, rice, and vegetables. It is highly effective and has a longer residual effect, but should be used responsibly to prevent resistance and protect beneficial insects."
  },
  {
    'image': 'assets/pesticide/Carbofuran.jpg',
    'title': "Carbofuran",
    'quantity': "1 kg",
    'rupees': 350.0,
    'description':
        "Carbofuran: Carbofuran is a broad-spectrum carbamate pesticide used to control soil-borne and foliar pests like caterpillars, beetles, and rootworms. It is effective on crops like paddy, sugarcane, and vegetables. However, it is toxic to birds and aquatic life, and its use is regulated in many areas."
  },
  {
    'image': 'assets/pesticide/Fipronil.jpg',
    'title': "Fipronil",
    'quantity': "500 ml",
    'rupees': 400.0,
    'description':
        "Fipronil: Fipronil is a broad-spectrum insecticide used to control pests such as ants, termites, fleas, and cockroaches. It works by inhibiting the insect’s nervous system. Fipronil is also used in agricultural applications, especially in rice and corn fields, but it is toxic to aquatic organisms."
  },
  {
    'image': 'assets/pesticide/Diazinon.jpg',
    'title': "Diazinon",
    'quantity': "500 ml",
    'rupees': 160.0,
    'description':
        "Diazinon: Diazinon is an organophosphate insecticide used for controlling a wide range of pests, including aphids, beetles, and mites. It is commonly used in agricultural fields, especially on crops like citrus and vegetables. It works by inhibiting the pest's acetylcholinesterase enzyme and must be handled carefully due to its toxicity."
  },
];
final List<Map<String, dynamic>> pesticideList3 = [
  {
    'image': 'assets/pesticide/Bifenthrin.jpg',
    'title': "Bifenthrin",
    'quantity': "250 ml",
    'rupees': 220.0,
    'description':
        "Bifenthrin: Bifenthrin is a pyrethroid insecticide used to control a wide range of pests including aphids, caterpillars, and termites. It is effective on crops such as cotton, maize, and vegetables. Bifenthrin is known for its long-lasting residual effect, providing protection for extended periods."
  },
  {
    'image': 'assets/pesticide/Acetamiprid.jpg',
    'title': "Acetamiprid",
    'quantity': "100 ml",
    'rupees': 180.0,
    'description':
        "Acetamiprid: Acetamiprid is a systemic insecticide that is effective against sucking pests such as aphids, whiteflies, and thrips. It is used in a variety of crops, including vegetables, fruits, and flowers. It works by targeting the insect's nervous system and is known for its low toxicity to humans and animals."
  },
  {
    'image': 'assets/pesticide/Pirimicarb.jpg',
    'title': "Pirimicarb",
    'quantity': "200 g",
    'rupees': 200.0,
    'description':
        "Pirimicarb: Pirimicarb is a selective insecticide used primarily for controlling aphids on a variety of crops including vegetables and fruits. It works by inhibiting acetylcholinesterase in pests and is considered safer for beneficial insects compared to many other chemical insecticides."
  },
  {
    'image': 'assets/pesticide/Deltamethrin.jpg',
    'title': "Deltamethrin",
    'quantity': "100 ml",
    'rupees': 170.0,
    'description':
        "Deltamethrin: Deltamethrin is a synthetic pyrethroid insecticide that is used to control pests such as mosquitoes, flies, and caterpillars. It is commonly applied to crops like cotton, vegetables, and fruits. It has a quick knockdown effect on pests but is safe for plants and animals when used properly."
  },
  {
    'image': 'assets/pesticide/LambdaCyhalothrin.jpg',
    'title': "LambdaCyhalothrin",
    'quantity': "250 ml",
    'rupees': 250.0,
    'description':
        "Lambda-Cyhalothrin: Lambda-Cyhalothrin is a broad-spectrum pyrethroid insecticide used to control a wide variety of pests, including aphids, beetles, and weevils. It is effective in many crops such as cotton, paddy, and vegetables. It has a long residual effect and works quickly against pests."
  },
];


  List<Map<String, dynamic>> _searchpestisidetables(
      List<Map<String, dynamic>> pesticideList) {
    return pesticideList
        .where((pesticide) =>
            pesticide['title'].toLowerCase().contains(_searchQuery) ||
            pesticide['description'].toLowerCase().contains(_searchQuery))
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

  Widget buildPesticideRow(List<Map<String, dynamic>> pesticideList1) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pesticideList1.length,
        itemBuilder: (context, index) {
          final item = pesticideList1[index];
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
          "Pesticide",
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
                  hintText: "search for pesticide",
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query.toLowerCase();
                  });
                },
              ),
            ),
            buildPesticideRow(_searchpestisidetables( pesticideList1)),
            buildPesticideRow(_searchpestisidetables( pesticideList2)),
            buildPesticideRow(_searchpestisidetables( pesticideList3)),

          ],
        ),
      ),
    );
  }
}

