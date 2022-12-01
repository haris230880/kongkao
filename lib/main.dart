import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:toast/toast.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
    );
  }
}
