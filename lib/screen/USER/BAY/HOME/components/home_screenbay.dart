
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Login/components/login_screen.dart';
import 'appbarhomepagebay.dart';
import 'body_homebay.dart';

late String userid;
late String userphone;
late String usertype;




class HomeScreenBay extends StatefulWidget {
  const HomeScreenBay({Key? key}) : super(key: key);

  @override
  State<HomeScreenBay> createState() => _HomeScreenBayState();
}

class _HomeScreenBayState extends State<HomeScreenBay> {
  
@override
  void initState() {
    super.initState();
    finduser();
  }
  Future<Null> finduser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('ID')!;
      userphone = preferences.getString('PhoneNumber')!;
      usertype = preferences.getString('Type')!;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarBay(),
      body: BodyHomePageBay(),


    );
  }
}
