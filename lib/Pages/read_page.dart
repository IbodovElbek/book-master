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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${DataBase.getbookname()}",style: TextStyle(color: Colors.white),),
        backgroundColor:Color.fromRGBO(6, 104, 134, 1),
centerTitle: true,
      ),
      body: Container(
padding: EdgeInsets.only(right:10,left: 10),
       child: Rm
       ),
        );
  }
}

