import 'dart:developer';

import 'package:ecommers_app/Model/order_model.dart';
import 'package:ecommers_app/View/rightArrowOrder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController title_Controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  TextEditingController date_Controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  // ignore: unused_field
  final String _searchQuery = "";

  List<OrderModel> todoCards = [];

  final List<Map> textList = [
    {"title": "On the way "},
    {"title": "Delivered"},
    {"title": "Cancelled"},
    {"title": "Returned"},
  ];

  List<Color> colorsList = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  final List<Map<String, dynamic>> statusItems = [
    {
      "text": "On the way",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "Delivered",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "Cancelled",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "Returned",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
  ];

  final List<Map<String, dynamic>> statusItemstime = [
    {
      "text": "On the way",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "2024",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "2023",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "2022",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "2021",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "2020",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
    {
      "text": "Older",
      "icon": Icons.add,
      "color": Colors.grey.shade200,
    },
  ];

  List<Map<String, dynamic>> items = [
    {
      'icon': Icons.star_outlined,
      'color': Colors.grey.shade400,
    },
    {
      'icon': Icons.star_outlined,
      'color': Colors.grey.shade400,
    },
    {
      'icon': Icons.star_outlined,
      'color': Colors.grey.shade400,
    },
    {
      'icon': Icons.star_outlined,
      'color': Colors.grey.shade400,
    },
    {
      'icon': Icons.star_outlined,
      'color': Colors.grey.shade400,
    },
  ];

  final List<Map<String, dynamic>> deliveries = [
    {
      "image": "assets/img12.jpeg",
      "status": "Delivered on Mon Nov 11",
      "description": "The Fresh Indian Potato from Maharashtra...",
      "ratingIcons": true,
      "rating": 0,
      "rateText": "Rate this product now",
    },
    {
      "image": "assets/img3.jpeg",
      "status": "Cancelled on Nov 06",
      "description": "The Fresh Indian Potato from Maharashtra...",
      "ratingIcons": false,
      "rating": 0,
      "rateText": "",
    },
    {
      "image": "assets/img6.jpeg",
      "status": "Delivered on Tue Nov 04",
      "description": "The Fresh Indian Potato from Maharashtra...",
      "ratingIcons": true,
      "rating": 0,
      "rateText": "Rate this product now",
    },
    {
      "image": "assets/img7.jpeg",
      "status": "Cancelled on Mar 22",
      "description": "The Fresh Indian Potato from Maharashtra...",
      "ratingIcons": false,
      "rating": 0,
      "rateText": "",
    },
  ];

 List<Map<String, dynamic>> filteredDeliveries = [];
 @override
  void initState() {
    super.initState();
    _loadRatings();
    // Initially, show all deliveries
    filteredDeliveries = deliveries;
  }

  

  void _searchDeliveries(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDeliveries = deliveries;
      } else {
        filteredDeliveries = deliveries.where((delivery) {
          return delivery["status"]
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              delivery["description"]
                  .toLowerCase()
                  .contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void Submit(bool doEdit, [OrderModel? todoObj]) {
    if (title_Controller.text.trim().isNotEmpty &&
        description_controller.text.trim().isNotEmpty &&
        date_Controller.text.trim().isNotEmpty) {
      if (doEdit) {
        todoObj!.title = title_Controller.text;
        // todoObj.description = description_controller.text;
        // todoObj.date = date_Controller.text;
      } else {
        //NEW ADD
        todoCards.add(
          OrderModel(
            title: title_Controller.text,
            // description: description_controller.text,
            //  date: date_Controller.text
          ),
        );
      }
    } else {
      print("Envalid data");
    }
    Navigator.of(context).pop();
    clearControllers();
    setState(() {});
  }

  void clearControllers() {
    title_Controller.clear();
    description_controller.clear();
    date_Controller.clear();
  }

  void showBottomSheet(bool doEdit, [OrderModel? todoObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        isDismissible: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filters",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Clear Filter",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Order Status",
                      style: GoogleFonts.quicksand(
                          color: const Color.fromRGBO(0, 139, 148, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 7,
                    ),

                    // it is the combination of both

                    Column(
                      children: [
                        Row(
                          children: List.generate(
                            2, // Display first two items
                            (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: index < 1 ? 20 : 0),
                              child: Container(
                                width: 160,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: statusItems[index]["color"],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      statusItems[index]["text"],
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        statusItems[index]["icon"],
                                        size: 24, // Adjust as needed
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: List.generate(
                            2,
                            (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: index < 1 ? 20 : 0),
                              child: Container(
                                width: 160,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: statusItems[index + 2]["color"],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      statusItems[index + 2]["text"],
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        statusItems[index]["icon"],
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Order Time",
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(0, 139, 148, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),

                    Column(
                      children: [
                        // First Row (On the Way + Year)

                        Row(
                          children: List.generate(
                            1,
                            (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: index < 1 ? 20 : 0),
                              child: Container(
                                width: 160,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: statusItemstime[0]["color"],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      statusItemstime[0]["text"],
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        statusItemstime[0]["icon"],
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),
                        // Second Row (Years)
                        Row(
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: index < 2 ? 20 : 0),
                              child: Container(
                                width: 110,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: statusItemstime[index + 1]["color"],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      statusItemstime[index + 1]["text"],
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        statusItemstime[index + 1]["icon"],
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Third Row (Years continued)

                        Row(
                          children: List.generate(
                            2,
                            (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: index < 1 ? 20 : 0),
                              child: Container(
                                width: 110,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: statusItemstime[index + 4]["color"],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      statusItemstime[index + 4]["text"],
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        statusItemstime[6]["icon"],
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Fourth Row (Older)

                        Row(
                          children: List.generate(
                            1,
                            (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: index < 1 ? 20 : 0),
                              child: Container(
                                width: 110,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: statusItemstime[6]["color"],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      statusItemstime[6]["text"],
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        statusItemstime[6]["icon"],
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (doEdit == true) {
                            Submit(true, todoObj);
                          } else {
                            Submit(false);
                          }
                        },
                        child: Text(
                          " Cancel",
                          style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 50,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.orange),
                        onPressed: () {
                          if (doEdit == true) {
                            Submit(true, todoObj);
                          } else {
                            Submit(false);
                          }
                        },
                        child: Text(
                          "Apply",
                          style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        });
  }
  //   Future<void> _loadRatings() async {
  //   final prefs= await SharedPreferences.getInstance();
  //   for (int i = 0; i < deliveries.length; i++) {
  //     deliveries[i]['rating'] = prefs.getInt('rating_$i') ?? 0; 
  //   }
  //   setState(() {});
  // }

   Future<void> _loadRatings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      for (int i = 0; i < deliveries.length; i++) {
        deliveries[i]['rating'] = prefs.getInt('rating_$i') ?? 0; // Default to 0
      }
      setState(() {});
    } catch (e) {
      log("Error loading ratings: $e");
    }
  }

  Future<void> _saveRating(int index, int rating) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('rating_$index', rating);
    } catch (e) {
      log("Error saving rating: $e");
    }
  }

 void _updateRating(int index, int rating) {
    setState(() {
      filteredDeliveries[index]['rating'] = rating;
    });
     _saveRating(index, rating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Order",
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30,
            ),
          ),
          
        ],
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: const Icon(Icons.arrow_back_ios,
          color:Colors.white ,
          )
          ),
        backgroundColor: Colors.green.shade500,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 80,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.grey.shade200),
                child: Row(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                      height: 100,
                      width: 300,
                      child: TextField(
                        controller: _searchController,
                        // controller: _searchController,
                        onChanged: _searchDeliveries,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          prefixIcon: IconButton(
                              onPressed: () {
                                _searchDeliveries(_searchController.text);
                              }, 
                              icon: const Icon(Icons.search)),
                          hintStyle: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // color: Colors.pinkAccent),
                          ),
                          hintText: 'Search your order here',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          true,
                        );
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.filter_list_sharp,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          true,
                        );
                        setState(() {});
                      },
                      child: Text(
                        "Filters",
                        softWrap: true,
                        style: GoogleFonts.quicksand(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDeliveries.length,
              itemBuilder: (context, index) {
                final delivery = filteredDeliveries[index];
                return Column(
                  children: [
                    Container(
                      height: delivery['ratingIcons'] ? 210 : 150,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Image.asset(
                              delivery['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Text(
                                    delivery['status'],
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    delivery['description'],
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                 if (delivery['ratingIcons'])
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      //mainAxisSize: MainAxisSize.min,
                                      children: List.generate(4, (i) {
                                        return IconButton(
                                          icon: Icon(
                                            Icons.star,
                                            color: i < delivery['rating']
                                                ? Colors.orange
                                                : Colors.grey,
                                                
                                          ),
                                          onPressed: () =>
                                              _updateRating(index, i + 1),
                                        );
                                      }),
                                    ),
                                  ),
                                if (delivery['ratingIcons'])
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Text(
                                      delivery['rateText'],
                                      style: GoogleFonts.quicksand(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Right_arrow_order(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
