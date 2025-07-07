// import 'dart:async';

// import 'package:ecommers_app/controller/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   @override
//   void initState() {
    
//     super.initState();

//     Timer(
//       const Duration(seconds: 3), 
//     (){
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder:(context){
//             return const LoginPage(name: "",);
//           }
//           )
//         );
//     });

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.black,
//         child: Center(
//           child: Text(
//             "AgriMart",
//             style: GoogleFonts.quicksand(
//               fontSize: 45,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





// // import 'package:ecommers_app/View/Homepage.dart';
// // import 'package:ecommers_app/controller/login_page.dart';
// // import 'package:flutter/material.dart';
// // // import 'package:player_names_app/view/login_screen.dart';
// // // import 'package:player_names_app/view/players_screen.dart';
// // // import 'package:player_names_app/widgets/session_data.dart';
// // class SplashScreen extends StatelessWidget {
// // const SplashScreen({super.key});
// // void navigate(BuildContext context) {
// // Future.delayed(
// // const Duration(seconds: 3),
// // () async {
// // bool status = false;
// // await SessionData.getSessionData();
// // print("IS LOGIN : ${SessionData.isLogin}");

// // if (SessionData.isLogin!) {
// // print("NAVIGATE TO HOME");
// // Navigator.of(context).pushReplacement(
// // MaterialPageRoute(
// // builder: (context) {
// // return HomeScreen(
// // email: SessionData.emailId!,
// // );
// // },
// // ),
// // );
// // } else {
// // print("NAVIGATE TO LOGIN");
// // Navigator.of(context).pushReplacement(
// // MaterialPageRoute(
// // builder: (context) {
// // return const LoginPage();
// // },
// // ),
// // );
// // }

// // },
// // );
// // }
// // @override
// // Widget build(BuildContext context) {
// // print("IN BUILD");
// // navigate(context);
// // return Scaffold(
// // body: Center(
// // child: SizedBox(
// // width: 250,
// // height: 250,
// // child: Image.network(

// // "https://www.shutterstock.com/image-vector/cricbuzz-cricket-news-website-logo-600nw-2323256191.jpg",

// // ),
// // ),
// // ),
// // );
// // }
// // }