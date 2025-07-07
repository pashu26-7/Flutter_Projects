import 'dart:async';
import 'package:ecommers_app/controller/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Duration of gradient swipe
    )..repeat(reverse: false); // Repeat animation infinitely

    Timer(
      const Duration(seconds: 4), // Duration before navigating to the next screen
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(name: "",), // Replace with your next screen
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black, // Background color
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors:const  [
                      Color.fromARGB(255, 54, 82, 244),
                      Colors.white,
                      Color.fromARGB(255, 237, 7, 26),
                    ],
                    stops: [
                      _controller.value - 0.1, // Starting position of swipe
                      _controller.value, // Mid-point of swipe
                      _controller.value + 0.1 , // Ending position of swipe
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    tileMode: TileMode.mirror, // Loop the gradient
                  ).createShader(bounds);
                },
                child: child,
              );
            },
            child: Text(
              "Agri Mart",
              style: GoogleFonts.sacramento(
              // style: GoogleFonts.lobster(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 114, 239, 4), // Base color (will be masked by gradient)
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// import 'package:ecommers_app/View/Homepage.dart';
// import 'package:ecommers_app/controller/login_page.dart';
// import 'package:flutter/material.dart';
// // import 'package:player_names_app/view/login_screen.dart';
// // import 'package:player_names_app/view/players_screen.dart';
// // import 'package:player_names_app/widgets/session_data.dart';
// class SplashScreen extends StatelessWidget {
// const SplashScreen({super.key});
// void navigate(BuildContext context) {
// Future.delayed(
// const Duration(seconds: 3),
// () async {
// bool status = false;
// await SessionData.getSessionData();
// print("IS LOGIN : ${SessionData.isLogin}");

// if (SessionData.isLogin!) {
// print("NAVIGATE TO HOME");
// Navigator.of(context).pushReplacement(
// MaterialPageRoute(
// builder: (context) {
// return HomeScreen(
// email: SessionData.emailId!,
// );
// },
// ),
// );
// } else {
// print("NAVIGATE TO LOGIN");
// Navigator.of(context).pushReplacement(
// MaterialPageRoute(
// builder: (context) {
// return const LoginPage();
// },
// ),
// );
// }

// },
// );
// }
// @override
// Widget build(BuildContext context) {
// print("IN BUILD");
// navigate(context);
// return Scaffold(
// body: Center(
// child: SizedBox(
// width: 250,
// height: 250,
// child: Image.network(

// "https://www.shutterstock.com/image-vector/cricbuzz-cricket-news-website-logo-600nw-2323256191.jpg",

// ),
// ),
// ),
// );
// }
// }