import 'package:ecommers_app/View/Homepage.dart';
import 'package:ecommers_app/controller/login_page.dart';
import 'package:ecommers_app/controller/splashScreenpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyAbcCx46DGfOB34Olnp6UAV8mP4hLDMZQE",
      appId:  "1:632287878212:android:2e4aa3a32cfcbcc7367011", 
      messagingSenderId: "632287878212", 
      projectId: "agrimart-9c2c4",
      ),
  ); // Initialize Firebase
   runApp(const Ecommers()); 
}

class Ecommers extends StatelessWidget{

  const Ecommers({super.key});
  @override  
   Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Splashscreen(),    
    );
   }
}
  class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
         
          return const Center(child: CircularProgressIndicator());  
        }
        if (snapshot.hasData) {
          
          return const HomeScreen();
        }
        
        return const LoginPage(name: "",);
      },
    );
  }
}