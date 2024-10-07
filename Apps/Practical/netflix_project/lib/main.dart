import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
       body: getBody(),
    );
  }
  Widget getBody(){
    //var size = MediaQuery.of(context).size.width;
    return const Padding(
      padding: EdgeInsets.only(bottom:10),
      // child: SingleChildScrollView(
      //   child: Stack(
      //     children: [
      //     Container(
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.only(left: 10),
      //               child: Image.network(
      //                 "https://images.ctfassets.net/y2ske730sjqp/5QQ9SVIdc1tmkqrtFnG9U1/de758bba0f65dcc1c6bc1f31f161003d/BrandAssets_Logos_02-NSymbol.jpg?w=940",
      //                 width: 35,
      //                 fit: BoxFit.cover,
      //                 ),
      //             ),
      //            const Row(
      //               children: [
      //                 IconButton(
      //                   icon: Icon(
      //                     Icons.collections_bookmark,
      //                     color: Colors.white,
      //                     size: 35,
      //                 ),
      //                 onPressed: null,
      //                 ),
      //                 IconButton(
      //                       icon:Image.network("https://d1csarkz8obe9u.cloudfront.net/posterpreviews/photography-logo%2C-photography-studio-logo-design-template-42261fff3bd70db2b7e9b5338fa1c03a_screen.jpg?ts=1667205867"
      //                       width: 26,
      //                       headers: 26,
      //                       fit: BoxFit.cover,
      //                       ),
      //                      color: Colors.white,
      //                       size: 35,
      //                 ),
      //                 onPressed: null,
      //                 ),
      //               ],
      //             ),
                  
      //           ],
      //         )
      //       ],
          );
          
        
    
  }
}
