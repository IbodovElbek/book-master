import 'package:book/Books/RamuzchiBobo.dart';
import 'package:book/Data/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Read_Page extends StatefulWidget {
  static final id="Read_Page";
  String? bookname;
   Read_Page({Key? key, this.bookname}) : super(key: key);

  @override
  State<Read_Page> createState() => _Read_PageState();
}

class _Read_PageState extends State<Read_Page> {
  RamuzchiBobo Rm=RamuzchiBobo();
  @override
  List<InlineSpan>qwerty=[TextSpan(text: "Salom"),TextSpan(text: "Salom"),TextSpan(text: "Salom"),TextSpan(text: "Salom"),TextSpan(text: "Salom"),TextSpan(text: "Salom"),TextSpan(text: "Salom"),TextSpan(text: "Salom"),TextSpan(text: "Salom"),];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: Rm

       ),
        );
  }
}

