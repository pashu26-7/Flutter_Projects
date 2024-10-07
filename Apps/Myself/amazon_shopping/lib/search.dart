import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_Page extends StatelessWidget {
  const Search_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CupertinoSearchTextField(
          autofocus: true,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(
            Icons.arconstrow_back_ios_new
            ),
        onPressed: (){
          Navigator.pop(context);
        },),
      ),
    );
  }
}