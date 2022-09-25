import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HOME/components/body_homebay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'body_profilebay.dart';


class ProFileUserBay extends StatefulWidget {
  const ProFileUserBay({Key? key}) : super(key: key);

  @override
  State<ProFileUserBay> createState() => _ProFileUserBayState();
}

class _ProFileUserBayState extends State<ProFileUserBay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyProFileBay());
  }
}

Future<Null> signOutprocess() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
}
