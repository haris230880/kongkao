import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';

import 'appbarhomepagesale.dart';
import 'body_homesale.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarSall(),
      body: BodyHomePageSall(),


    );
  }
}
