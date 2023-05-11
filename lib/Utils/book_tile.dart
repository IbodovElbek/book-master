import 'package:book/Data/database.dart';
import 'package:book/Services/log_service.dart';
import 'package:book/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/read_page.dart';

class Book_Tile extends StatelessWidget {
  final String image;
  final String bookname;
  final bool isFavorite;
  void Function() onChanged;
 void Function()   toreadPage;
String? bookname1;
  Book_Tile({
    Key? key,
    required this.toreadPage,
    required this.isFavorite,
    required this.onChanged,
    required this.image,
    required this.bookname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 20, left: 20),
      child: InkWell(
        onTap:toreadPage,
        child: Container(
          padding: EdgeInsets.only(left: 6, top: 5, bottom: 5, right: 6),
          height: 54,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(254, 254, 254, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Text(bookname),
              ),
              Container(
                height: 16,
                width: 20,
                child: Center(
                    child: InkWell(
                  onTap:onChanged,
                  child: isFavorite
                      ?Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ): Image(image: AssetImage(Assets.imagesFavorite)),

                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
