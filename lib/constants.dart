import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

const kPrimaryColor = Color(0xFF72A92A);
const kPrimaryLightColor = Color.fromARGB(255, 183, 225, 83);
const kPrimaryblckColor =  Color(0xFF807E7E);
const kPrimarybackgron =  Color.fromARGB(71, 164, 232, 168);
const kPrimarybackgron2 =  Color.fromARGB(155, 70, 138, 97);




const TextStyleblodgreen = TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: kPrimaryColor);


const kDefaultPaddin=20.0;

class fixsixe{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;


  // height ==> 781
  //width ==> 392


  // 500 == 1.56  781 / 220


  static double pageViewContainer= screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;



  static double pageView= screenHeight/2.6;
  static double listViewImgSize = screenWidth/3.25;
  static double listviewTextContSize = screenWidth/3.9;

  static double listViewImgSize200 = screenWidth/2.25;
  static double listviewTextContSize200 = screenWidth/2.9;

  static double height50 = screenHeight/3.9;

  static double TextContSize50 = screenHeight/3.9;


  static double height580 = screenHeight/1.34;
  static double height250 = screenHeight/3.12;

  static double height80 = screenHeight/9.76;
  static double witht80 = screenHeight/9.76;


  static double height530 = screenHeight/1.47;


}