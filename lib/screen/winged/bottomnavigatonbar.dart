import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:project/screen/winged/map.dart';
import 'package:project/screen/winged/searchbox.dart';

import '../../constants.dart';
import '../Login/components/login_screen.dart';
import '../Regis/components/regis.dart';
import '../Home/components/appbarhomepage.dart';
import '../Home/components/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  final screen = [
    WingetMaps(),
    HomeScreen(),
    Center(
      child: Text('profile'),
    ),
    Center(
      child: Text('profile'),
    ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryLightColor,
        tooltip: 'ADD',
        child: Icon(
          Icons.search,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
