import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String fransuz;
  final String uzbek;
final bool  isStar;
  void Function()? addWord;


  DialogBox({Key? key,
    required this.fransuz,
    required this.uzbek,
    required this.addWord,
    required this.isStar,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: addWord,
                  icon: !isStar
                      ? Icon(
                          Icons.star_border_outlined,
                          color: Colors.amberAccent,
                          size: 35,
                        )
                      : Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                          size: 35,
                        ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        fransuz,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Text(
                        uzbek,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: addWord, child: Center(child: Text("Add word"))),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 100, child: Center(child: Text("Ok")))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
