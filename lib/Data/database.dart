import 'package:hive/hive.dart';

class DataBase{
  static var box=Hive.box("book");
  static void setbookname(String bookname)async{
    box.put("bookname", bookname);
  }
  static String getbookname(){
    var bookname=box.get("bookname");
    return bookname;
  }

  static void setfavorite(List list)async{
    box.put("favorite", list);
  }

  static List getfavorite(){
    var list=box.get("favorite");
    return list;
  }

  static void setbooks(List list)async{
    box.put("books", list);
  }

  static List getbooks(){
    var list=box.get("books");
    return list??[
      ['assets/images/ayiq.png', "Qirq yolg'on", false],
      ['assets/images/bemor.png', "Qirq yolg'on2", false],
      [ 'assets/images/jazo.png',"Qirq yolg'on", false],
      [ 'assets/images/moddiy.png', "Qirq yolg'on", false],
      [ 'assets/images/otaga.png',"Qirq yolg'on", false],
      [ 'assets/images/qimmat.png', "Qirq yolg'on", false],
      [ 'assets/images/qirq.png',"Qirq yolg'on", false],
      [ 'assets/images/ramuzchi.png', "Qirq yolg'on", false],
      [ 'assets/images/soat.png',"Qirq yolg'on", false],
      ['assets/images/ayiq.png', "Qirq yolg'on", false],
      ['assets/images/bemor.png', "Qirq yolg'on2", false],
      [ 'assets/images/jazo.png',"Qirq yolg'on", false],
      [ 'assets/images/moddiy.png', "Qirq yolg'on", false],
      [ 'assets/images/otaga.png',"Qirq yolg'on", false],
      [ 'assets/images/qimmat.png', "Qirq yolg'on", false],
      [ 'assets/images/qirq.png',"Qirq yolg'on", false],
      [ 'assets/images/ramuzchi.png', "Qirq yolg'on", false],
      [ 'assets/images/soat.png',"Qirq yolg'on", false],
      [ 'assets/images/splash.png', "Qirq yolg'on", false],
      [ 'assets/images/yaxshibola.png',"Qirq yolg'on", false],
    ];
  }
}