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
    return list??[];
  }

  static void setbooks(List list)async{
    box.put("books", list);
  }

  static List getbooks(){
    var list=box.get("books");
    return list??[
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
}