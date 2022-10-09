import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:project/winged/map.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Order'), elevation: 0, backgroundColor: kPrimaryColor),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: 200,child: WingetMaps(),)

            ],
          ),
        ),
      ),
    );
  }
}
