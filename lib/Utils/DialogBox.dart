import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String fransuz;
  final String uzbek;
   DialogBox({Key? key, required this.fransuz, required this.uzbek}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 150,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(fransuz,style: TextStyle(color: Colors.black,fontSize: 25),),
                Text(uzbek,style: TextStyle(color: Colors.grey,fontSize: 15),),
              ],
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Center(child: Text("Add word"))),
                SizedBox(width: 15,),

                ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Container(width: 100, child: Center(child: Text("Ok")))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
