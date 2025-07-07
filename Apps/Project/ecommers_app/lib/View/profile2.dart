
import 'package:ecommers_app/controller/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProfileScreen(),
    );
  }
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  File? _selectedImage;

  // ignore: unused_field
  String? _name;
  // ignore: unused_field
  String? _email;

  String? _nameError;
  String? _phoneError;
  String? _emailError;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
      _email = prefs.getString('email');
    });
  }

  // ignore: unused_element
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage(name: "",)),
    );
  }


  // @override
  // void initState() {
  //   super.initState();
  //   _nameController.text = "Akash";
  //   _phoneController.text = "7410741577";
  //   _emailController.text = "s9309091577@gmail.com";
  // }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _uploadImageAndSaveProfile() async {
    try {
      String? avatarUrl;

      // Upload image if selected
      if (_selectedImage != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('avatars/${_phoneController.text}.jpg');
        await storageRef.putFile(_selectedImage!);
        avatarUrl = await storageRef.getDownloadURL();
      }

      // Save profile to Firestore
      await FirebaseFirestore.instance.collection('users').doc(_phoneController.text).set({
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'email': _emailController.text.trim(),
        'avatarUrl': avatarUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating profile: $e',
              style: const TextStyle(fontSize: 16)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _updateProfile() {
    setState(() {
      Navigator.pop(context);
      _nameError = null;
      _phoneError = null;
      _emailError = null;

      // Validation
      if (_nameController.text.trim().isEmpty) {
        _nameError = "Name is required.";
      }

      if (_phoneController.text.trim().isEmpty) {
        _phoneError = "Phone number is required.";
      } else if (_phoneController.text.trim().length != 10 ||
          !RegExp(r'^[0-9]+$').hasMatch(_phoneController.text.trim())) {
        _phoneError = "Enter a valid 10-digit phone number.";
      }

      if (_emailController.text.trim().isEmpty) {
        _emailError = "Email is required.";
      } else if (!RegExp(
              r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
          .hasMatch(_emailController.text.trim())) {
        _emailError = "Enter a valid email address.";
      }

      if (_nameError == null && _phoneError == null && _emailError == null) {
        _uploadImageAndSaveProfile();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 26,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Avatar with Edit Icon
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color.fromARGB(255, 33, 136, 36),
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : null,
                  child: _selectedImage == null
                      ? const Text(
                          'A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 33, 136, 36),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Container with Shadow Behind All Fields
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 8,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Name Field
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name*",
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      border: const OutlineInputBorder(),
                      errorText: _nameError,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 16.0),
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),

                  // Phone Field
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone Number*",
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      border: const OutlineInputBorder(),
                      errorText: _phoneError,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 16.0),
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),

                  // Email Field
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email Address*",
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      border: const OutlineInputBorder(),
                      errorText: _emailError,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 16.0),
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Update Button
            ElevatedButton(
              onPressed: _updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 33, 136, 36),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Update",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


