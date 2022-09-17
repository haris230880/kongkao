import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/USER/SALE/Home/components/home_screensale.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:project/winged/map.dart';


import '../../../../constants.dart';



class HomePageSell extends StatefulWidget {
  const HomePageSell({Key? key}) : super(key: key);

  @override
  State<HomePageSell> createState() => _HomePageSellState();
}

class _HomePageSellState extends State<HomePageSell> {
  int currentIndex = 1;
  final screen = [
    WingetMaps(),
    HomeScreen(),
    Center(
      child: Text('profile'),
    ),
    LoginScreen()
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
              icon: Icon(Icons.add_a_photo),
              label: 'Manu',
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Home',
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'profile',
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'profile',
              backgroundColor: kPrimaryColor),
        ],
      ),
    );
  }
}
