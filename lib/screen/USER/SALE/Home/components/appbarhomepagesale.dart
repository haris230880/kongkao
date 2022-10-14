import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';

import '../../../../../future_All.dart';

AppBar HomeAppBarSall() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.jpg')
        ),
        SizedBox(width: 10,),
        RichText(
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
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.search_rounded,
            color: Colors.white,
          )),
    ],
  );
}
