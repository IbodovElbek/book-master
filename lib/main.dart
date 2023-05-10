import 'package:book/Pages/Home_Page.dart';
import 'package:book/Pages/Like_Page.dart';
import 'package:book/Pages/Splash_page.dart';
import 'package:book/Pages/book_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox('book');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash_Page(),
      routes: {
        Splash_Page.id:(context)=>Splash_Page(),
        Book_List.id:(context)=>Book_List(),
        Like_Page.id:(context)=>Like_Page(),
        HomePage.id:(context)=>HomePage(),
      },
    );
  }
}
