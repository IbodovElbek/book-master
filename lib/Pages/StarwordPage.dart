import 'package:book/Services/log_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/database.dart';
import '../generated/assets.dart';

class StarPage extends StatefulWidget {
  static final  id = "StarPage";

  const StarPage({Key? key}) : super(key: key);

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Removeword;
  }
  List Uwords = DataBase.getStarvalueWord();
  List Fwords = DataBase.getStarkeyWord();
  void Removeword(int index){
    Uwords.removeAt(index);
    Fwords.removeAt(index);
    DataBase.setStarSvalueWord(Fwords);
    DataBase.setStarSkeyWord(Uwords);
    LogService.i(Uwords.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          return Words(index);
        },
      ),
    );
  }

  Widget Words(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 20, left: 20),
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
              child: Center(
                  child: Text(
            "${Uwords[index]}",
            style: TextStyle(fontSize: 20),
          ))),
          IconButton(
              onPressed: ()=>Removeword(index),
              icon: Icon(Icons.delete,color: Colors.red,)
          )
        ],
      ),
    );
  }
}
