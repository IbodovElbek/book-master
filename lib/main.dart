import 'package:book/Pages/Home_Page.dart';
import 'package:book/Pages/Like_Page.dart';
import 'package:book/Pages/Splash_page.dart';
import 'package:book/Pages/book_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'Pages/StarwordPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('book');
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('fr', 'FR'), Locale('uz', 'UZ')],
        path: 'assets/translation', // <-- change the path of the translation files
        fallbackLocale: Locale('uz', 'UZ'),
        child: MyApp()
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
        StarPage.id:(context)=>StarPage(),
      },
    );
  }
}
