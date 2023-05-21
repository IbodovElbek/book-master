import 'package:book/Pages/Like_Page.dart';
import 'package:book/Pages/book_list.dart';
import 'package:book/Pages/read_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../generated/assets.dart';
import 'StarwordPage.dart';

class HomePage extends StatefulWidget {
  static final id = "HomePage";

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;
  @override
  var _pages = [
    Book_List(),
    Read_Page(),
    StarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: _pages[currentpage],
      bottomNavigationBar: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 8),
        padding: EdgeInsets.only(right: 50, left: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 5), // changes the shadow position
              ),
            ],
            color: Colors.white),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      currentpage = 0;
                    });
                  },
                  icon: currentpage == 0
                      ? const ImageIcon(AssetImage(Assets.imageIconsBooklist),
                          size: 30, color: Colors.red)
                      : const ImageIcon(AssetImage(Assets.imageIconsBooklist),
                          color: Colors.black)),
            ),
            Expanded(
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    currentpage = 1;
                  });
                },
                icon: currentpage == 1
                    ? const ImageIcon(AssetImage(Assets.imageIconsReadpage),
                        size: 40, color: Colors.red)
                    : const ImageIcon(AssetImage(Assets.imageIconsReadpage),
                        size: 35, color: Colors.black),
              ),
            ),
            Expanded(
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    currentpage = 2;
                  });
                },
                icon: currentpage == 2
                    ? Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                        size: 35,
                      )
                    : Icon(
                        Icons.star_border,
                        color: Colors.amberAccent,
                        size: 30,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
