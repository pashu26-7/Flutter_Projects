import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/customSnaker.dart';
import 'package:ecommers_app/controller/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _repasswordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _repasswordError;

  String? name;
  String? email;

  // Future<void> _signup() async {
  //   setState(() {
  //     _nameError = _nameTextEditingController.text.trim().isEmpty
  //         ? "Name is required."
  //         : null;
  //     _emailError = _emailTextEditingController.text.trim().isEmpty
  //         ? "Email is required."
  //         : null;
  //     _passwordError = _passwordTextEditingController.text.trim().isEmpty
  //         ? "Password is required."
  //         : null;
  //   });

  //   if (_nameError == null && _emailError == null && _passwordError == null) {
  //     try {
  //       final UserCredential userCredential =
  //           await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: _emailTextEditingController.text.trim(),
  //         password: _passwordTextEditingController.text.trim(),
  //       );
  //       await userCredential.user
  //           ?.updateDisplayName(_nameTextEditingController.text.trim());

  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(userCredential.user!.email)
  //           .set({
  //         'name': _nameTextEditingController.text.trim(),
  //         'email': _emailTextEditingController.text.trim(),
  //       });
  //       final prefs = await SharedPreferences.getInstance();
  //      await prefs.setString('name', _nameTextEditingController.text.trim());
  //      await  prefs.setString('email', _emailTextEditingController.text.trim());

  //       log('Saved Name: ${prefs.getString('name')}');
  //       log('Saved Email: ${prefs.getString('email')}');

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const LoginPage()),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(e.message ?? "Signup failed")),
  //       );
  //     }
  //   }
  // }


//akash
Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? "Loading..";
      email = prefs.getString('email') ?? "Loading..";
    });
  }

  Future<void> _signup() async {
  setState(() {
    _nameError = _nameTextEditingController.text.trim().isEmpty
        ? "Name is required."
        : null;
    _emailError = _emailTextEditingController.text.trim().isEmpty
        ? "Email is required."
        : null;
    _passwordError = _passwordTextEditingController.text.trim().isEmpty
        ? "Password is required."
        : null;
  });

  if (_nameError == null && _emailError == null && _passwordError == null) {
    try {
      // Create user with email and password
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailTextEditingController.text.trim(),
        password: _passwordTextEditingController.text.trim(),
      );

      // Update the display name of the user
      await userCredential.user?.updateDisplayName(_nameTextEditingController.text.trim());

      // Save the name and email in Firestore under the user's email as doc ID
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.email).set({
        'name': _nameTextEditingController.text.trim(),
        'email': _emailTextEditingController.text.trim(),
      });

      // Save name and email in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameTextEditingController.text.trim());
      await prefs.setString('email', _emailTextEditingController.text.trim());

      log('Saved Name: ${prefs.getString('name')}');
      log('Saved Email: ${prefs.getString('email')}');

      // Navigate to LoginPage after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginPage(name: _nameTextEditingController.text,)),
      );
    } on FirebaseAuthException catch (e) {
      // Handle signup error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Signup failed")),
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
            image: AssetImage('assets/login/sign.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "SignUp",
            style: GoogleFonts.quicksand(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 105, top: 10),
              child: SizedBox(
                width: 200,
                height: 200,

                // child: Text(
                //   "  Create \n  Account",
                //   style: GoogleFonts.quicksand(
                //       color: Colors.white,
                //       fontSize: 30,
                //       fontWeight: FontWeight.w700),
                // ),
                child: Image.asset(
                  'assets/logo1.png',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.23,
                  right: 35,
                  left: 35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: _nameTextEditingController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    if (_nameError != null)
                      Text(
                        _nameError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    if (_emailError != null)
                      Text(
                        _emailError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: _passwordTextEditingController,
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
                    if (_passwordError != null)
                      Text(
                        _passwordError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      "Re-Password",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: _repasswordTextEditingController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Re-Password',
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
                    if (_repasswordError != null)
                      Text(
                        _repasswordError!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 80),
                      width: 250,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 210, 233, 8),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              _nameError =
                                  _nameTextEditingController.text.trim().isEmpty
                                      ? "Name is required"
                                      : null;
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
                              _repasswordError =
                                  _repasswordTextEditingController.text
                                          .trim()
                                          .isEmpty
                                      ? "RePassword is required"
                                      : null;
                            });

                            if (_nameTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                _emailTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                _passwordTextEditingController.text
                                    .trim()
                                    .isNotEmpty &&
                                _repasswordTextEditingController.text
                                    .trim()
                                    .isNotEmpty) {
                              try {
                                UserCredential userCredential =
                                    await _firebaseAuth
                                        .createUserWithEmailAndPassword(
                                  email:
                                      _emailTextEditingController.text.trim(),
                                  password: _passwordTextEditingController.text
                                      .trim(),
                                );



                                await  FirebaseFirestore.instance.collection("users").add({
                                  "avatarUrl":null,
                                  "email":_emailTextEditingController.text,
                                  "name":_nameTextEditingController.text,
                                  "phone":"1234567890"

                               } );

                                log("User : $userCredential");


                                CustomSnackbar.showCustomSnackbar(
                                    context: context,
                                    message: "User Regester successfully");
                                // Navigator.of(context).pop();

                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage(name: _nameTextEditingController,)));
                              } on FirebaseAuthException catch (error) {
                                log(error.code);
                                log("${error.message}");
                                CustomSnackbar.showCustomSnackbar(
                                    message: error.message!, context: context);
                              }
                            } else {
                              CustomSnackbar.showCustomSnackbar(
                                  message: "Please Enter Valid Data",
                                  context: context);
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// onTap: ()  async{
//   if(_nameTextEditingController.text.trim().isNotEmpty &&
//   _emailTextEditingController.text.trim().isNotEmpty &&
//   _passwordTextEditingController.text.trim().isNotEmpty &&
//    _repasswordTextEditingController.text.trim().isNotEmpty
//   ){
//     try{
//        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: _emailTextEditingController.text.trim(),
//         password: _passwordTextEditingController.text.trim(),
//         );
//         log("User : $userCredential");
//         CustomSnackbar.showCustomSnackbar(
//           context: context,
//           message: "User Regester successfully"
//         );
//         Navigator.of(context).pop();
//     }on FirebaseAuthException catch(error){
//       log("${error.code}");
//       log("${error.message}");
//       CustomSnackbar.showCustomSnackbar(message: error.message!, context: context
//       );
//     }
//   }
//   else{
//       CustomSnackbar.showCustomSnackbar(message: "please enter valid data", context: context
//       );

//   }
// },
