
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/future_All.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/USER/BAY/ProFile/body_profilebay.dart';
import 'package:project/screen/USER/BAY/ProFile/profile_sereenbay.dart';
import 'package:project/screen/USER/SALE/Home/components/home_screensale.dart';
import 'package:project/screen/USER/SALE/OrderScreen/orderSreenSale.dart';
import 'package:project/screen/USER/SALE/ProFile/profile_sereenbay.dart';
import 'package:project/winged/map.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../constants.dart';
import '../../../configs/services/api.dart';
import '../../../model/usermodel.dart';
import '../BAY/HOME/components/home_screenbay.dart';
import '../BAY/NotiFication/notificationBayScreen.dart';




class HomePageSell extends StatefulWidget {
  const HomePageSell({Key? key}) : super(key: key);

  @override
  State<HomePageSell> createState() => _HomePageSellState();
}


class _HomePageSellState extends State<HomePageSell> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    finduser();
  }
int currentIndex = 0;
  final screen = [
    HomeScreensale(),
    OrderScreenSale(),
    NotiFicationBayScreen(),
    ProFileUserSaleSreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryblckColor,
        items: [ 
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'หน้าเเรก',
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_sharp),
              label: 'รายการ',
              backgroundColor: kPrimaryColor),
         
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert),
              label: 'เเจ้งเตือน',
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'ผู้ใช้',
              backgroundColor: kPrimaryColor),
        ],
      ),
    );
  }
}
