
import 'package:flutter/material.dart';

class MainUserBay extends StatefulWidget {
  const MainUserBay({Key? key}) : super(key: key);

  @override
  State<MainUserBay> createState() => _MainUserBayState();
}

class _MainUserBayState extends State<MainUserBay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mainBay')),
      body: Center(),

    );
  }
}
