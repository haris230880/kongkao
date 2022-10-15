
import 'package:flutter/material.dart';
import 'package:project/future_All.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/USER/BAY/ProFile/body_profilebay.dart';
import 'package:project/screen/USER/BAY/ProFile/profile_sereenbay.dart';
import 'package:project/screen/USER/SALE/Home/components/home_screensale.dart';
import 'package:project/winged/map.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../constants.dart';
import '../BAY/HOME/components/home_screenbay.dart';



class HomePageSell extends StatefulWidget {
  const HomePageSell({Key? key}) : super(key: key);

  @override
  State<HomePageSell> createState() => _HomePageSellState();
}

class _HomePageSellState extends State<HomePageSell> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  int currentIndex = 0;
  final screen = [
     HomeScreen(),
    WingetMaps(),
    Center(
      child: Text('profile'),
    ),
    ProFileUserBaySreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryblckColor,
        items: [ 
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Home',
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: 'Manu',
              backgroundColor: kPrimaryColor),
         
          BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'profile',
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
              backgroundColor: kPrimaryColor),
        ],
      ),
    );
  }
}
