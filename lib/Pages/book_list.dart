import 'package:book/Data/database.dart';
import 'package:book/Pages/read_page.dart';
import 'package:book/Services/log_service.dart';
import 'package:book/Utils/book_tile.dart';
import 'package:book/Utils/drawer.dart';
import 'package:book/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Book_List extends StatefulWidget {
  static final id = "Book_List";

  const Book_List({Key? key}) : super(key: key);

  @override
  State<Book_List> createState() => _Book_ListState();
}

class _Book_ListState extends State<Book_List> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstchek();
    favoritelist ();
  }
  List books=[];
 List firstchek(){
    if(DataBase.getbooks()==null){
      books=[
        ['assets/images/qirq.png', "Qirq yolg‘on", false],
        ['assets/images/moddiy.png', "Moddiy yordam", false],
        [ 'assets/images/jazo.png',"Jazo", false],
        [ 'assets/images/ramuzchi.png', "Ramuzchi Boboy", false],
        [ 'assets/images/yaxshibola.png',"Yaxshi bola", false],
        [ 'assets/images/qimmat.png', "Qimmatli sovg’a", false],
        [ 'assets/images/otaga.png',"Otaga itoat qilish kerak", false],
        [ 'assets/images/ayiq.png', "Ayiqpolvonning xatosi", false],
        [ 'assets/images/soat.png',"Soat", false],
        ['assets/images/bemor.png', "Bemor piyoz", false],

      ];
    }
    else{
      books=DataBase.getbooks();
    }
    return books;
}
  List favorite=[];
List favoritelist(){
   if(DataBase.getfavorite()==null){
     favorite=[];
   }
   else{
     favorite=DataBase.getfavorite();
   }
   return favorite;
}
  void CheckFavorite(int index) {
    setState(() {
      books[index][2] = !books[index][2];
      if(books[index][2]){
        favorite.add(books[index]);
        DataBase.setfavorite(favorite);
        DataBase.setbooks(books);
      }else{
        favorite.remove(books[index]);
        DataBase.setfavorite(favorite);
        DataBase.setbooks(books);
      }
    });
  }
  Future _openReaderwithcontainer(String bookname) async {
 DataBase.setbookname(bookname);
 LogService.i(DataBase.getfavorite().length.toString());
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Read_Page(bookname: bookname,);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
drawer: Drawer(
  backgroundColor:Color.fromRGBO(222, 217, 218, 1),
  child: SafeArea(
    child: Column(
      children: [
       Container(
         child:Center(child: Text("SIMPLE",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),) ,
         height: 90,

       ),
        SizedBox(height: 10,),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12)
          ),
          child: Row(
            children: [
              SizedBox(width: 12,),
              Center(child: Text("Words",style: TextStyle(fontSize: 20),)),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.only(left: 12,right: 12),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Center(child: Text("Haqida",style: TextStyle(fontSize: 20),)),
              Icon(Icons.info_outline,size: 20,)
            ],
          ),
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12)
          ),
        )
      ],
    ),
  ),
),
        backgroundColor: Color.fromRGBO(222, 217, 218, 0.3),
        appBar: AppBar(actions: [
          Icon(Icons.info_outline,color: Colors.black,),
          SizedBox(width: 20,)
        ],
          // leading: IconButton(
          //   tooltip: ,
          //   onPressed: (){
          //   Scaffold.of(context).openDrawer();
          //   },
          //   icon: Icon(Icons.more_horiz_outlined,color: Colors.black,size: 35,),
          // ),
          centerTitle: true,
          title: Text(
            "SIMPLE",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontFamily: "Inter"),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (BuildContext context,int index){
            return  Book_Tile(
              toreadPage:()=>_openReaderwithcontainer(books[index][1].toString()),
              image: books[index][0],
              bookname: books[index][1],
              isFavorite: books[index][2],
              onChanged:()=>CheckFavorite(index),
            );
          },

        ));
  }
}
