import 'package:book/Data/database.dart';
import 'package:book/Pages/read_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/log_service.dart';
import '../Utils/book_tile.dart';

class Like_Page extends StatefulWidget {
  static final id="Like_Page";
  const Like_Page({Key? key}) : super(key: key);

  @override
  State<Like_Page> createState() => _Like_PageState();
}

class _Like_PageState extends State<Like_Page> {

  List favorites=DataBase.getfavorite();



  void CheckFavorite(int index) {
    setState(() {
      favorites[index][2] = !favorites[index][2];
      if(!favorites[index][2]){
        favorites.remove(favorites[index]);
        DataBase.setfavorite(favorites);
      }
    });

    LogService.i(favorites.length.toString());
  }
  Future _openReaderwithcontainer(String bookname) async {
    DataBase.setbookname(bookname);
    LogService.i(DataBase.getbookname().toString());
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Read_Page(bookname: bookname,);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 217, 218, 0.3),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context,int index){
          return  Book_Tile(
            toreadPage:()=>_openReaderwithcontainer(favorites[index][1].toString()),
            image: favorites[index][0],
            bookname: favorites[index][1],
            isFavorite: favorites[index][2],
            onChanged:()=>CheckFavorite(index),

          );
        },

      ),
    );
  }
}
