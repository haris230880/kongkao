import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
    );
  }
}
