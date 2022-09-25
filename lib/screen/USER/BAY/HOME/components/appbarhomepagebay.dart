import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/USER/BAY/HOME/components/body_homebay.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/SALE/Home/components/body_homesale.dart';

import 'home_screenbay.dart';

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
