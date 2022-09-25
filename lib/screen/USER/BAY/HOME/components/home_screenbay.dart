import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../HomePageBay.dart';
import 'appbarhomepagebay.dart';
import 'body_homebay.dart';


late String userid;
late String userphone;



class HomeScreenBay extends StatefulWidget {
  const HomeScreenBay({Key? key}) : super(key: key);

  @override
  State<HomeScreenBay> createState() => _HomeScreenBayState();
}

class _HomeScreenBayState extends State<HomeScreenBay> {
  @override
  void initState() {
    super.initState();
    finduser();
  }
  Future<Null> finduser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('ID')!;
      userphone = preferences.getString('PhoneNumber')!;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarBay(),
      body: BodyHomePageBay(),


    );
  }
}
