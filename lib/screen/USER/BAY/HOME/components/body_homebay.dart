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
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black26,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  height: 100,
                  width: 150,
                  child: CircleAvatar(
                    child: Image.asset('assets/icons/Aluminium.png',),
                  ),
                ),
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('เบอร์โทร:  $userid',style: TextStyle(fontSize: 18),),
                        Text('ชื่อร้าน:',style: TextStyle(fontSize: 18)),
                        Text('ค่าบริการ:',style: TextStyle(fontSize: 18)),
                        Text('เวลาทำการ:',style: TextStyle(fontSize: 18)),
                      ],
                    )
                    ),
              ],

              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding:
              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor // Set border color
                  ), // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: kPrimaryColor,
                        offset: Offset(1, 1))
                  ] // Make rounded corner of border
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "เข้าสู่ระบบ ",
                    style: TextStyleblodgreen,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
