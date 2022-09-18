import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';

import 'appbarhomepagebay.dart';
import 'body_homebay.dart';

class HomeScreenBay extends StatefulWidget {
  const HomeScreenBay({Key? key}) : super(key: key);

  @override
  State<HomeScreenBay> createState() => _HomeScreenBayState();
}

class _HomeScreenBayState extends State<HomeScreenBay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHomePageBay(),


    );
  }
}
