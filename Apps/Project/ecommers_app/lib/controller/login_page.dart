import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/customSnaker.dart';
import 'package:ecommers_app/View/Homepage.dart';
import 'package:ecommers_app/controller/signup.dart';
import 'package:ecommers_app/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final name;
  const LoginPage({super.key, required this.name});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  //  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _emailError;
  String? _passwordError;

  // if(_emailTextEditingController.text.trim().isEmpty){
  //   _emailError ="Email is required";

  // }
  // if(_PasswordTextEditingController.text.trim().isEmpty){
  //   _emailError ="Email is required";

  // }

    Future<void> _login() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

  if (_emailError == null && _passwordError == null) {
      try {
        final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailTextEditingController.text.trim(),
          password: _passwordTextEditingController.text.trim(),
        );

        // Store user details in SharedPreferences
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.email)
            .get();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', userDoc['name']);
        await prefs.setString('email', userCredential.user!.email!);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Login failed")),
        );
      }
    }
  }

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login/login4.jpeg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        //drawerEnableOpenDragGesture: true,
        backgroundColor: const Color.fromARGB(0, 125, 119, 119),
        // appBar: AppBar(
        //   title: Text(
        //     "AgriMart",
        //     style: GoogleFonts.quicksand(
        //       fontSize: 25,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.red
        //     ),
        //     ),
        // ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 165),
                child: Text(
                  "WelCome To AgriMart",
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.36,
                    right: 35,
                    left: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to AgriMart",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please enter your credentails",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: _emailTextEditingController,
                      // style: GoogleFonts.quicksand(
                      //   fontSize: 10,
                      //   fontWeight: FontWeight.w600,
                      //   color: Colors.white
                      // ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // enabledBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.white
                        //   )
                        // )
                      ),
                      //errorText: _emailError,
                    ),
                    if (_emailError !=
                        null) 
                      Text(
                        _emailError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: _passwordTextEditingController,
                      
                      obscureText: _showPassword,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _showPassword = !_showPassword;
                            setState(() {});
                          },
                          child: Icon(
                            (_showPassword)
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    if (_passwordError !=
                        null) 
                      Text(
                        _passwordError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: SizedBox(
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: const Color.fromARGB(255, 59, 56, 239)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      
                      padding: const EdgeInsets.only(left: 80),

                      width: 250,
                      
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 42, 133, 225),
                            ),
                          ),
                          onPressed: () async {
                            
                            setState(() {
                              _emailError = _emailTextEditingController.text
                                      .trim()
                                      .isEmpty
                                  ? "Email is required"
                                  : null;
                              _passwordError = _passwordTextEditingController
                                      .text
                                      .trim()
                                      .isEmpty
                                  ? "Password is required"
                                  : null;
                            });

                            if (_emailTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                _passwordTextEditingController.text
                                    .trim()
                                    .isNotEmpty) {
                              try {
                                UserCredential userCredential =
                                    await _firebaseAuth
                                        .signInWithEmailAndPassword(
                                  email:
                                      _emailTextEditingController.text.trim(),
                                  password: _passwordTextEditingController.text
                                      .trim(),
                                );
                                log("Agrimart : UserCredentials:${userCredential.user!.email}");
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return HomeScreen(name: widget.name,);
                                }));
                              } on FirebaseAuthException catch (error) {
                                log("Agrimart : Error : ${error.code}");
                                log("Agrimart : Error : ${error.message}");
                                CustomSnackbar.showCustomSnackbar(
                                    message: error.code, context: context);
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0, right: 18),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '-----------',
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              'Or Login With',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '----------',
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                //color: const Color(0xff484848),
                                borderRadius: BorderRadius.circular(5)),
                            //child:const Icon(Icons.g_mobiledata,color: Colors.pink,size: 50,),
                            child: ClipRRect(
                                child: Image.asset(
                              "assets/google.png",
                            ))),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              //color:const  Color(0xff484848),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.apple,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              //color:const  Color(0xff484848),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, top: 10),
                      child: Text(
                        "Don't have an account ?",
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 80),
                      width: 250,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 204, 216, 32),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:developer';

// import 'package:ecommers_app/Model/customSnaker.dart';
// import 'package:ecommers_app/View/Homepage.dart';
// import 'package:ecommers_app/controller/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   String? _emailError;
//   String? _passwordError;

//   bool _showPassword = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/login.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 35, top: 160),
//                 child: Text(
//                   "Welcome To \n   AgriMart",
//                   style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.39,
//                   right: 35,
//                   left: 35,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Login to AgriMart",
//                       style: GoogleFonts.quicksand(
//                         color: Colors.black,
//                         fontSize: 30,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       "Please enter your credentials",
//                       style: GoogleFonts.quicksand(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Text(
//                       "Email",
//                       style: GoogleFonts.quicksand(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     const SizedBox(height: 3),
//                     TextField(
//                       controller: _emailTextEditingController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         errorText: _emailError,
//                       ),
//                     ),
//                     if (_emailError != null)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 4),
//                         child: Text(
//                           _emailError!,
//                           style: const TextStyle(color: Colors.red, fontSize: 12),
//                         ),
//                       ),
//                     const SizedBox(height: 20),
//                     Text(
//                       "Password",
//                       style: GoogleFonts.quicksand(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     const SizedBox(height: 3),
//                     TextField(
//                       controller: _passwordTextEditingController,
//                       obscureText: !_showPassword,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         errorText: _passwordError,
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _showPassword = !_showPassword;
//                             });
//                           },
//                           child: Icon(
//                             _showPassword
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                     if (_passwordError != null)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 4),
//                         child: Text(
//                           _passwordError!,
//                           style: const TextStyle(color: Colors.red, fontSize: 12),
//                         ),
//                       ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             const Color.fromARGB(255, 42, 133, 225),
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                       onPressed: () async {
//                         setState(() {
//                           _emailError = _emailTextEditingController.text
//                                   .trim()
//                                   .isEmpty
//                               ? "Email is required"
//                               : null;
//                           _passwordError = _passwordTextEditingController.text
//                                   .trim()
//                                   .isEmpty
//                               ? "Password is required"
//                               : null;
//                         });

//                         if (_emailError == null && _passwordError == null) {
//                           try {
//                             UserCredential userCredential = await _firebaseAuth
//                                 .signInWithEmailAndPassword(
//                               email: _emailTextEditingController.text.trim(),
//                               password:
//                                   _passwordTextEditingController.text.trim(),
//                             );
//                             log("Agrimart: UserCredentials: ${userCredential.user!.email}");
//                             Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                 builder: (context) => const HomeScreen(),
//                               ),
//                             );
//                           } on FirebaseAuthException catch (error) {
//                             log("Agrimart: Error: ${error.code}");
//                             log("Agrimart: Error: ${error.message}");
//                             CustomSnackbar.showCustomSnackbar(
//                               message: error.code,
//                               context: context,
//                             );
//                           }
//                         }
//                       },
//                       child: Text(
//                         "Login",
//                         style: GoogleFonts.quicksand(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const SignUpPage(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         "Don't have an account? Sign Up",
//                         style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





//akash code

// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/customSnaker.dart';
// import 'package:ecommers_app/View/Homepage.dart';
// import 'package:ecommers_app/controller/signup.dart';
// import 'package:ecommers_app/screens/profile_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:ui'; // Import for blur effect

// class LoginPage extends StatefulWidget {
//   final name;
//   const LoginPage({super.key, required this.name});

//   @override
//   State<LoginPage> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   String? _emailError;
//   String? _passwordError;

//   Future<void> _login() async {
//     setState(() {
//       _emailError = null;
//       _passwordError = null;
//     });

//     if (_emailError == null && _passwordError == null) {
//       try {
//         final UserCredential userCredential = await _firebaseAuth
//             .signInWithEmailAndPassword(
//           email: _emailTextEditingController.text.trim(),
//           password: _passwordTextEditingController.text.trim(),
//         );

//         final userDoc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.email)
//             .get();
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('name', userDoc['name']);
//         await prefs.setString('email', userCredential.user!.email!);

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileScreen()),
//         );
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message ?? "Login failed")),
//         );
//       }
//     }
//   }

//   bool _showPassword = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Background with blur effect
//         Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/login/login3.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Apply blur effect
//             child: Container(
//               color: Colors.black.withOpacity(0), // Transparent overlay
//             ),
//           ),
//         ),
//         Scaffold(
//           backgroundColor: const Color.fromARGB(0, 125, 119, 119),
//           body: SingleChildScrollView(
//             child: Stack(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(left: 35, top: 165),
//                   child: Text(
//                     "WelCome To \n   AgriMart",
//                     style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.36,
//                     right: 35,
//                     left: 35,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Login to AgriMart",
//                         style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 30,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         "Please enter your credentials",
//                         style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Text(
//                         "Email",
//                         style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                       const SizedBox(height: 3),
//                       TextField(
//                         controller: _emailTextEditingController,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           hintText: 'Email',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       if (_emailError != null)
//                         Text(
//                           _emailError!,
//                           style: const TextStyle(color: Colors.red, fontSize: 12),
//                         ),
//                       const SizedBox(height: 20),
//                       Text(
//                         "Password",
//                         style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                       const SizedBox(height: 3),
//                       TextField(
//                         controller: _passwordTextEditingController,
//                         obscureText: _showPassword,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           hintText: 'Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           suffixIcon: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _showPassword = !_showPassword;
//                               });
//                             },
//                             child: Icon(
//                               _showPassword
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                       if (_passwordError != null)
//                         Text(
//                           _passwordError!,
//                           style: const TextStyle(color: Colors.red, fontSize: 12),
//                         ),
//                       const SizedBox(height: 20),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: _login,
//                           child: Text(
//                             "Login",
//                             style: GoogleFonts.quicksand(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
