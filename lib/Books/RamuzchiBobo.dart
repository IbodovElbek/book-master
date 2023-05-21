import 'package:book/Data/database.dart';
import 'package:book/Services/log_service.dart';
import 'package:book/Utils/DialogBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Utils/Snacbar_helper.dart';
import 'books.dart';

class RamuzchiBobo extends StatefulWidget {
  const RamuzchiBobo({Key? key}) : super(key: key);

  @override
  State<RamuzchiBobo> createState() => _RamuzchiBoboState();

}

class _RamuzchiBoboState extends State<RamuzchiBobo> {
  List Starskey=[];
  List Starsvalue=[];
bool isStar=false;


  String? _text;
  List<String>? chagewords;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _text=Books.bookstext["${DataBase.getbookname()}"];
      chagewords=Books.changewords["${DataBase.getbookname()}"];
      Starskey=DataBase.getStarkeyWord();
      Starsvalue=DataBase.getStarvalueWord();

    });
  }

  void AddWordStar(String uzbek,String fransuz){
    if(!DataBase.getStarkeyWord().contains(uzbek)){
      Starskey.add(uzbek);
      Starsvalue.add(fransuz);
      DataBase.setStarSkeyWord(Starskey);
      DataBase.setStarSvalueWord(Starsvalue);
      showSuccessMessage(context, message: "Word succses added");
      Navigator.pop(context);
    }
    else{
      Starsvalue.remove(fransuz);
      Starskey.remove(uzbek);
      DataBase.setStarSkeyWord(Starskey);
      DataBase.setStarSvalueWord(Starsvalue);
      LogService.e( DataBase.getStarkeyWord().toString());
      LogService.w( DataBase.getStarvalueWord().toString());
      showErrorMessage(context, message: "Sucsses removed");
      Navigator.pop(context);
    }
    LogService.i( DataBase.getStarkeyWord().contains(uzbek).toString());
    LogService.d( DataBase.getStarvalueWord().toString());
  }







  bool isselected=false;
  @override
  Widget build(BuildContext context) {
    List<InlineSpan>textSpan=[];
    List<String> words=_text!.split(" ");
    for(int word=0;word<= words.length-1;word++){
      if(chagewords!.contains(words[word])){
        textSpan.add(TextSpan(
          style: TextStyle(color: Colors.red,fontSize: 18),
          recognizer: TapGestureRecognizer()
            ..onTap=(){
              String fransuz ="${Books.frtranslate["${DataBase.getbookname()}"]["${words[word]}"]}";
              String uzbek= "${Books.uztranslate["${DataBase.getbookname()}"]["${words[word]}"]}";
           showDialog(context: context, builder: (context){

             return DialogBox(
               addWord:()=> AddWordStar(fransuz,uzbek),
               uzbek: uzbek,
               fransuz: fransuz,
             );
           });

            },
          text: "${words[word]}"+' ',

        )
        );
      }
      else{
        textSpan.add(TextSpan(
          text: "${words[word]} ",
          style: TextStyle(color: Colors.black,fontSize: 18),
        ));
      }
    }
    return ListView(children: [
      RichText(text: TextSpan(
        children: textSpan,
      )),
    ],

    );

  }
}
