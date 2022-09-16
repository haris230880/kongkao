
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/USER/SALE/Home/components/body_home.dart';
import 'main_user_sell.dart';

class MainUserBay extends StatefulWidget {
  const MainUserBay({Key? key}) : super(key: key);

  @override
  State<MainUserBay> createState() => _MainUserBayState();
}

class _MainUserBayState extends State<MainUserBay> {
  @override
  void initState(){
    super.initState();
    finduser();

  }
  Future<Null>finduser()async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('phoneNumber')!;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userid == null ?'mainsell'   :'$userid login' ),),
      body: Center(child: Text('phone$userid '),),

    );
  }
}
