import 'dart:async';

import 'package:book/Pages/Home_Page.dart';
import 'package:book/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_list.dart';

class Splash_Page extends StatefulWidget {
  static final id="Splash_page";
  const Splash_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<Splash_Page> {
  _timer (){
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context,HomePage.id);
    });
  }
  @override
  void initState() {
    _timer();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Container(
             width: double.infinity,
             height: MediaQuery.of(context).size.height,
             child: Image(
                image: AssetImage(Assets.imagesSplash),
               fit: BoxFit.cover,
              ),
           ),
          Center(child: Text("Simple",style: TextStyle(color: Colors.white,fontSize: 77),))
        ],
      ),
    );
  }
}
