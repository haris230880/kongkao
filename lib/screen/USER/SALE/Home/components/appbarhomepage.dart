import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';



AppBar HomeAppBar() {
  return AppBar(
    backgroundColor:kPrimaryColor,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          // Navigator.push(
          // context,
          // MaterialPageRoute(
          // builder: (context) {
          // return LoginScreen();
          // },
          // ),
          // );
        },
        icon: Icon(
          Icons.dehaze,
          color: Colors.white,
        )),
    title: RichText(
      textAlign: TextAlign.right,
      text: TextSpan(children: [
        TextSpan(
          text: "K",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        TextSpan(
          text: "ongkao",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ]),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_alert,
            color: Colors.white,
          )),
    ],
  );
}