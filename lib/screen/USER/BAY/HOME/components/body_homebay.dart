//import 'dart:html';//เม้น

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/USER/SALE/Home/components/backgroundhomesale.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/winged/categoryitemmanu.dart';
import 'package:project/winged/searchbox.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../main/main_user_sell.dart';
import 'home_screenbay.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Null> signOutprocess() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
}

late String userid;

class BodyHomePageBay extends StatefulWidget {
  const BodyHomePageBay({Key? key}) : super(key: key);

  @override
  State<BodyHomePageBay> createState() => _BodyHomePageBayState();
}

class _BodyHomePageBayState extends State<BodyHomePageBay> {
  //------------------
  @override
  void initState() {
    super.initState();
    finduser();
  }

  Future<Null> finduser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('phoneNumber')!;
    });
  }

  //ฟังช้่นlogout
//------------
  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageSell(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: Column(children: [
                      CircleAvatar(
                        maxRadius: 50,
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'USERNAME',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'เเก้ไขข้อมูล  >',
                            style: TextStyle(fontSize: 16),
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
