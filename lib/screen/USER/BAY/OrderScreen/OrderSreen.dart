import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HOME/components/appbarhomepagebay.dart';
import 'package:project/screen/USER/BAY/OrderScreen/BodyOrder.dart';

import '../../../../constants.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/icons/userbay.png',
                scale: 10,
              ),
            ),
            RichText(
              textAlign: TextAlign.right,
              text: TextSpan(children: [
                TextSpan(
                  text: "K",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                TextSpan(
                  text: "ongkao ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ]),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text('ประวัติ',style: TextStyle(color: Colors.white),),
                 SizedBox(width: 5,),
                  Icon(Icons.history,color: Colors.white,),
                ],
              ))
          // Container(
          //   child: Row(
          //     children: [
          //       Text('ประวัติคำสั่งซื้อ'),
          //       IconButton(onPressed: () {}, icon: Icon(Icons.history)),
          //     ],
          //   ),
          // )
        ],
      ),
      body: BodyOrder(),
    );
  }
}
