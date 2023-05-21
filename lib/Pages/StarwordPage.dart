import 'package:book/Services/log_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/database.dart';
import '../generated/assets.dart';

class StarPage extends StatefulWidget {
  static final id = "StarPage";

  const StarPage({Key? key}) : super(key: key);

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List Uwords = DataBase.getStarvalueWord();
  List Fwords = DataBase.getStarkeyWord();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 217, 218, 0.3),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "WORDS",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: Assets.staticInterBold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: Uwords.length,
        itemBuilder: (context, int index) {
          return Container(
            height: 65,
            margin: EdgeInsets.only(top: 8,right: 12,left: 12),
            decoration: BoxDecoration(
              color:  Color.fromRGBO(254, 254, 254, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ListTile(
                title: Text("${Uwords[index]}-${Fwords[index]} "),
                trailing: Container(
                  width: 40,
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    Uwords.removeAt(index);
                                    Fwords.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                )
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
