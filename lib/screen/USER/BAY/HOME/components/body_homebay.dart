import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/OrderScreen/OrderSreen.dart';

import 'package:project/screen/USER/SALE/Home/components/backgroundhomesale.dart';
import 'package:project/winged/oeder_list_shop.dart';

import '../../EditProduct/editproduct.dart';
import 'home_screenbay.dart';

class BodyHomePageBay extends StatefulWidget {
  const BodyHomePageBay({Key? key}) : super(key: key);

  @override
  State<BodyHomePageBay> createState() => _BodyHomePageBayState();
}

class _BodyHomePageBayState extends State<BodyHomePageBay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundHomePageSell(
      child: Column(
        children: [
          HeaderHomePageBay(),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderListShop();
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/icons/plasticbottle.png'),
                        Text(
                          'พลาสติก',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderListShop();
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/icons/paper.png',
                          scale: 20,
                        ),
                        Text(
                          'กระดาษ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderListShop();
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/icons/Aluminium.png'),
                        Text(
                          'อลูมิเนียม',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kPrimaryColor.withOpacity(0.20)),
                      ]),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderListShop();
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/icons/glass.png'),
                        Text(
                          'แก้ว',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryblckColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 80,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: kPrimaryColor.withOpacity(0.20)),
                ]),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderListShop();
                    },
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/icons/other.png',
                    scale: 12,
                  ),
                  Text(
                    'อื่น ๆ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryblckColor,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container HeaderHomePageBay() {
    return Container(
      margin: EdgeInsets.only(bottom: 1, top: 0),
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 130,
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 1),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Row(
              children: [
                Text(
                  'user$usertype: $userphone',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(50),
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: kPrimaryColor.withOpacity(0.4)),
                    ]),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditProduct();
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'เพิ่มรายการสินค้า',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryblckColor,
                            fontSize: 18),
                      ),
                      Image.asset('assets/icons/userbay.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
