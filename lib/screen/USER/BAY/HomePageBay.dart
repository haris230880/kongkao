
import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HOME/components/home_screenbay.dart';
import 'package:project/screen/USER/BAY/NotiFication/notificationBayScreen.dart';
import 'package:project/screen/USER/BAY/OrderScreen/OrderSreen.dart';

import '../../../constants.dart';
import 'ProFile/profile_sereenbay.dart';


class HomePageBay extends StatefulWidget {
  const HomePageBay({Key? key}) : super(key: key);

  @override
  State<HomePageBay> createState() => _HomePageBayState();
}

class _HomePageBayState extends State<HomePageBay> {
  int currentIndex = 0;
  final screen = [
    HomeBayScreen(),
    OrderScreen(),
    NotiFicationBayScreen(),
    ProFileUserBaySreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BayBottomNavigationBar(),
    );
  }

  BottomNavigationBar BayBottomNavigationBar() {
    return BottomNavigationBar(
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
            icon: Icon(Icons.offline_pin_rounded),
            label: 'คำสั่งซื้อ',
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
    );
  }
}
