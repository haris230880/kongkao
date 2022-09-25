import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/USER/BAY/HOME/components/home_screenbay.dart';
import '../screen/USER/SALE/Home/components/body_homesale.dart';



class MainUserSell extends StatefulWidget {
  const MainUserSell({Key? key}) : super(key: key);
  @override
  State<MainUserSell> createState() => _MainUserSellState();
}

class _MainUserSellState extends State<MainUserSell> {
  //--------------------------------
  @override
  void initState() {
    super.initState();
    finduser();
  }
  Future<Null> finduser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('phoneNumber')!;
    });
  }
//-----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userid == null ? 'mainsell' : '$userid login'),
      ),
      body: Column(children: [
        Text('phone$userid '),
      ]),
    );
  }
}
