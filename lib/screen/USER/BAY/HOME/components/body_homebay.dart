//import 'dart:html';//เม้น

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/USER/SALE/Home/components/backgroundhomesale.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:project/winged/categoryitemmanu.dart';
import 'package:project/winged/searchbox.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../main/main_user_sell.dart';
import '../../EditProduct/editproduct.dart';
import 'home_screenbay.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Future<Null> signOutprocess() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.clear();
//   exit(0);
// }


class BodyHomePageBay extends StatefulWidget {
  const BodyHomePageBay({Key? key}) : super(key: key);

  @override
  State<BodyHomePageBay> createState() => _BodyHomePageBayState();
}

class _BodyHomePageBayState extends State<BodyHomePageBay> {
  //------------------
  // @override
  // void initState() {
  //   super.initState();
  //   finduser();
  // }

  // Future<Null> finduser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     userid = preferences.getString('phoneNumber')!;
  //   });
  // }

  //ฟังช้่นlogout
//------------
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundHomePageSell(
      child: Column(
        children: [
          HeaderHomePageBay(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/icons/plasticbottle.png'),
                        Text(
                          'พลาสติก',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/icons/paper.png'),
                        Text(
                          'กระดาษ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/icons/Aluminium.png'),
                        Text(
                          'อลูมิเนียม',
                        style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/icons/glass.png'),
                        Text(
                          'แก้ว',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 80,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: kPrimaryColor.withOpacity(0.20)),
                ]),
            child: OutlinedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/icons/other.png',scale: 12,),
                  Text(
                    'อื่น ๆ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryblckColor,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container HeaderHomePageBay() {
    return Container(
      margin: EdgeInsets.only(bottom: 1, top: 0),
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 1),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Row(children: [
              Text(
                'Hi! $userphone',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Image.asset(
                'assets/icons/icon.png',
                scale: 10,
              ),
            ]),
          ),
          Positioned(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(20),
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: kPrimaryColor.withOpacity(0.50)),
                    ]),
                child: OutlinedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditProduct();
                        },
                      ),
                    );

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'เพิ่มรายการสินค้า',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryblckColor,
                            fontSize: 18),
                      ),
                      Image.asset('assets/icons/userbay.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
