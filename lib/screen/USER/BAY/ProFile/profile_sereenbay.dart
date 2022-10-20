
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../configs/services/api.dart';
import '../../../../future_All.dart';
import '../../../../model/usermodel.dart';
import '../../../../my_style.dart';


import '../HomePageBay.dart';
import 'body_profilebay.dart';


class ProFileUserBaySreen extends StatefulWidget {
  const ProFileUserBaySreen({Key? key}) : super(key: key);

  @override
  State<ProFileUserBaySreen> createState() => _ProFileUserBaySreenState();
}

class _ProFileUserBaySreenState extends State<ProFileUserBaySreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finduser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:BodyProFileBay());
  }
}


