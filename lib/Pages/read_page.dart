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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(DataBase.getbookname(),style: TextStyle(color: Colors.black,fontSize:20),),
      ),
    );
  }
}

