import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/View/faqs.dart';
import 'package:ecommers_app/View/favourite.dart';
import 'package:ecommers_app/View/notification.dart';
import 'package:ecommers_app/View/orderhis.dart';
import 'package:ecommers_app/View/privacy_policy.dart';
// import 'package:ecommers_app/View/profile2.dart';
import 'package:ecommers_app/View/term_conditions.dart';
import 'package:ecommers_app/controller/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? name;
  String? email;
  List<Map<String, String>> favorites = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _loadUserData();
  // }
  // Future<void> _loadUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? retrievedName = prefs.getString('name');
  //   String? retrievedEmail = prefs.getString('email');

  //   if (retrievedName == null || retrievedEmail == null) {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       retrievedName = user.displayName;
  //       retrievedEmail = user.email;
  //     }
  //   }
  //   log('Retrieved Name: $retrievedName');
  //   log('Retrieved Email: $retrievedEmail');

  //   setState(() {
  //     name = retrievedName ?? "Your Name";
  //     email = retrievedEmail ?? "Your Email";
  //   });
  // }

  @override
  void initState() {
    log("init state");
    fetchData();

    _loadUserData();
    super.initState();
  }

  void fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("users").get();

    for (int i = 0; i < response.docs.length; i++) {
      log("NAME NAED:- ${response.docs[i]['name']}");
      log("NAME EMAIL :- ${response.docs[i]['email']}");

      if (email == response.docs[i]['email']) {
        log("NAME :- ${response.docs[i]['name']}");

        name = response.docs[i]['name'];
      }
    }
    setState(() {});
  }

  Future<void> _loadUserData() async {
    // ignore: unused_element
    void fetchData() async {
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection("users").get();

      for (int i = 0; i < response.docs.length; i++) {
        if (email == response.docs[i]['email']) {
          log("NAME :- ${response.docs[i]['name']}");

          name = response.docs[i]['name'];
        }
      }
    }

    final prefs = await SharedPreferences.getInstance();
    String? retrievedName = name;
    String? retrievedEmail = prefs.getString('email');

    // If name and email are not found in SharedPreferences, fallback to Firebase user data
    if (retrievedName == null || retrievedEmail == null) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        retrievedName =
            user.displayName ?? "Your Name"; // Fallback if no display name
        retrievedEmail = user.email ?? "Your Email"; // Fallback if no email
      }
    }

    log('Retrieved Name: $retrievedName');
    log('Retrieved Email: $retrievedEmail');

    setState(() {
      name = retrievedName ?? "Your Name"; // Default value if name is null
      email = retrievedEmail ?? "Your Email"; // Default value if email is null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 240, 240, 193),
      width: 410,
      child: Column(
        children: [
          // App bar of the drawer
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 33, 136, 36),
            ),
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            height: 100,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    // Close the drawer
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  "Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // ListView for the main content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 10, right: 10),
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 25, top: 5),
                  child: Row(
                    children: [
                      GestureDetector(
                        //navigate to profie screen
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const ProfileScreen(),
                        //     ),
                        //   );
                        // },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name ?? "Loading..",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 900,
                              child: Text(
                                email ?? "Loading..",
                                style: const TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Other items in the drawer
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderHistoryScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Color.fromARGB(255, 33, 136, 36),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderHistoryScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "My Orders",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 136, 36),
                                  ),
                                ),
                              ),
                              const Text(
                                "View & Track your recent orders",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 33, 136, 36),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Favourite(favoriteItems: favorites)),
                          );
                        },
                        child: Container(
                          child: ListTile(
                            leading: const Icon(Icons.favorite_border,
                                color: Color.fromARGB(255, 33, 136, 36)),
                            title: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Favorite",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 136, 36),
                                  ),
                                ),
                                Text(
                                  "Favorite items",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            trailing: GestureDetector(
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 33, 136, 36),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                      ListTile(
                        leading: const Icon(Icons.share,
                            color: Color.fromARGB(255, 33, 136, 36)),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Share App",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 33, 136, 36),
                                ),
                              ),
                            ),
                            const Text(
                              "Send invite to your friends",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color.fromARGB(255, 33, 136, 36),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotificationPage()),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(Icons.notifications_none,
                              color: Color.fromARGB(255, 33, 136, 36)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Notification",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 136, 36),
                                  ),
                                ),
                              ),
                              const Text(
                                "View notifications",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 33, 136, 36)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutAgrimartScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(Icons.privacy_tip_outlined,
                              color: Color.fromARGB(255, 33, 136, 36)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AboutAgrimartScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 136, 36),
                                  ),
                                ),
                              ),
                              const Text(
                                "View privacy policy",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AboutAgrimartScreen(),
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 33, 136, 36)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TermsAndConditionsScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(Icons.text_snippet_outlined,
                              color: Color.fromARGB(255, 33, 136, 36)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TermsAndConditionsScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Terms & Conditions",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 136, 36),
                                  ),
                                ),
                              ),
                              const Text(
                                "View T&C",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsAndConditionsScreen(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 33, 136, 36),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FAQsScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(Icons.question_answer_outlined,
                              color: Color.fromARGB(255, 33, 136, 36)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const FAQsScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "FAQS",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 136, 36),
                                  ),
                                ),
                              ),
                              const Text(
                                "View FAQS",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FAQsScreen(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 33, 136, 36),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage(
                                      name: "",
                                    )),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(Icons.logout,
                              color: Color.fromARGB(255, 33, 136, 36)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage(
                                              name: "",
                                            )),
                                  );
                                },
                                child: const Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 33, 136, 36),
                                  ),
                                ),
                              ),
                              const Text(
                                "Application will logout",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage(
                                          name: "",
                                  )
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 33, 136, 36)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 0.5, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
