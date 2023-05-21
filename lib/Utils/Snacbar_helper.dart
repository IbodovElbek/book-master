import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, {required String message}){
  final snackBar=SnackBar(backgroundColor: Colors.red,
    duration:Duration(milliseconds: 300) ,
    content: Text(message,style: TextStyle(color: Colors.white),),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessMessage(BuildContext context, {required String message}){
  final snackBar=SnackBar(
    duration:Duration(milliseconds: 300) ,
    backgroundColor: Colors.lightBlueAccent,
    content: Text(message,style: TextStyle(color: Colors.black),),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}