
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Login/components/login_screen.dart';
import 'appbarhomepagebay.dart';
import 'body_homebay.dart';


  String? userid;
  String? userphone;
  String? usertype;


class HomeBayScreen extends StatefulWidget {
  const HomeBayScreen({Key? key}) : super(key: key);

  @override
  State<HomeBayScreen> createState() => _HomeBayScreenState();
}

class _HomeBayScreenState extends State<HomeBayScreen> {

@override
  void initState() {
    super.initState();
    finduser();
  }
  Future<Null> finduser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('ID');
      userphone = preferences.getString('PhoneNumber');
      usertype = preferences.getString('Type');

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
