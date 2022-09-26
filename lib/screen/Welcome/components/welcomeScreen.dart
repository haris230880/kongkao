import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/SALE/HomePageSell.dart';
import 'package:project/screen/Welcome/components/bobywelcome.dart';
import 'package:project/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../future_All.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    chackPreferance();
  }
Future<Null> signOutprocess() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
}
  Future<Null> chackPreferance() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? choseType = preferences.getString('Type');
      if (choseType != null && choseType.isNotEmpty) {
        if (choseType == 'sale') {
          routetoservice(HomePageSell());
        } else if (choseType == 'bay') {
          routetoservice(HomePageBay());
        }else {
          normaDiolog(context, 'Error User type');
        }
      }
    } catch (e) {}
  }

  void routetoservice(Widget myWinget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWinget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWelcome(),
    );
  }
}
