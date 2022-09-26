import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/OrderScreen/BodyOrder.dart';

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
          elevation: 0,
          backgroundColor: Colors.white,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'คำสั่งซื้อ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                      },
                      child: Text('คำสั่งซื้อ',
                          style: TextStyle(color: Colors.black)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('ดำเนินการ',
                          style: TextStyle(color: Colors.black)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('เสร็จสิ้น',
                          style: TextStyle(color: Colors.black)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child:
                          Text('ยกเลิก', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: BodyOrder(),
    );
  }
}
