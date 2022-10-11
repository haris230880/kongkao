
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../future_All.dart';
import '../../../../Login/components/login_screen.dart';
import '../../HomePageBay.dart';
import 'appbarhomepagebay.dart';
import 'body_homebay.dart';




class HomeBayScreen extends StatefulWidget {
  const HomeBayScreen({Key? key}) : super(key: key);

  @override
  State<HomeBayScreen> createState() => _HomeBayScreenState();
}

class _HomeBayScreenState extends State<HomeBayScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarBay(),
      body: BodyHomePageBay(),


    );
  }
}
