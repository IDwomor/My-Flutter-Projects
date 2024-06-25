import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    //color: Colors.deepPurpleAccent,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  //backgroundColor: Colors.white,
  shadowColor: Colors.black,
  elevation: 10,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20)
    ),
  ),
  //surfaceTintColor: Colors.amber,
  /*side: const BorderSide(
    color: Colors.blue,
    width: 1
  ),*/
);