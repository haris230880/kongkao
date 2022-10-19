
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/screen/USER/SALE/ProFile/editprofile.dart';
import '../../../../configs/services/api.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';import '../../../../model/usermodel.dart';
import '../../../../my_style.dart';


import 'body_profilebay.dart';


class ProFileUserSaleSreen extends StatefulWidget {
  const ProFileUserSaleSreen({Key? key}) : super(key: key);

  @override
  State<ProFileUserSaleSreen> createState() => _ProFileUserSaleSreenState();
}

class _ProFileUserSaleSreenState extends State<ProFileUserSaleSreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finduser();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(body:BodyProFileSale());
  }
}


