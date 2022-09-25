import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/SALE/HomePageSell.dart';
import 'package:project/screen/Welcome/components/bobywelcome.dart';
import 'package:project/winged/nomalDiolog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    chackPreferance();
  }

  Future<Null> chackPreferance() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? choseType = preferences.getString('Type');
      if (choseType != null && choseType.isNotEmpty) {
        if (choseType == '1') {
          routetoservice(HomePageSell());
        } else if (choseType == '2') {
          routetoservice(HomePageBay());
        }else {
          normaDiolog(context, 'Error User type');
        }
      }
    } catch (e) {}
  }

  void routetoservice(Widget myWinget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWinget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWelcome(),
    );
  }
}

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(body: BodyWelcome(),);
//   }
// }
