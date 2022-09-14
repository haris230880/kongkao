import 'package:flutter/material.dart';
class MainUserSell extends StatefulWidget {
  const MainUserSell({Key? key}) : super(key: key);

  @override
  State<MainUserSell> createState() => _MainUserSellState();
}

class _MainUserSellState extends State<MainUserSell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mainsell')),
      body: Center(child: Text("data"),),

    );
  }
}
