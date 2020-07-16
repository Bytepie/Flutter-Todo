import 'package:flutter/material.dart';

ContinuousRectangleBorder kRoundRectangle =
    ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20));

const TextStyle kSubTitle = TextStyle(
    fontSize: 20,
    color: Color(0xFF212121),
    fontWeight: FontWeight.w400,
    letterSpacing: 0);

const TextStyle kSubTitleCanceled = TextStyle(
    fontSize: 20,
    color: Color(0xFF010131),
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.w200,
    letterSpacing: 0);

const TextStyle kAppTitle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w700,
    color: Color(0xFF212121),
    letterSpacing: 2);

const BoxDecoration kShadowDecorated = BoxDecoration(boxShadow: [
  BoxShadow(
      blurRadius: 10,
//                        offset: Offset(1, 2),
      color: Colors.black26)
], color: Colors.yellow, borderRadius: BorderRadius.all(Radius.circular(12)));

const BoxDecoration kUpperShadowDecorated = BoxDecoration(
    boxShadow: [
      BoxShadow(
          blurRadius: 10,
//                        offset: Offset(1, 2),
          color: Colors.black26)
    ],
    color: Colors.tealAccent,
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(30), topLeft: Radius.circular(30)));

const InputDecoration kInputDecoration = InputDecoration(
  hintStyle: kAppTitle,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);
