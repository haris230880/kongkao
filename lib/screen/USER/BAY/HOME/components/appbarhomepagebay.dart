import 'package:flutter/material.dart';
import 'package:project/constants.dart';

AppBar HomeAppBarBay() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,

    title: RichText(
      textAlign: TextAlign.right,
      text: TextSpan(children: [
        TextSpan(
          text: "K",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        TextSpan(
          text: "ongkao ",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ]),
    ),
  );
}
