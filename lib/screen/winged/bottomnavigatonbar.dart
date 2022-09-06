import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:project/screen/winged/bottomnavigatonbar.dart';




int currentIndex = 2;


// BottomNavigationBar BottomNavigationBarHomePage() {
//   return BottomNavigationBar(
//       backgroundColor:kPrimaryColor,
//       currentIndex: currentIndex,
//       selectedItemColor: Colors.white,
//       onTap: (index) => setState(() => currentIndex = index),
//
//       items: [
//     BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Home',),
//     BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'login'),
//
//
//   ]);
// }