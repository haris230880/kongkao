import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/my_style.dart';
import 'package:project/winged/dimesions.dart';

import '../../../BAY/HomePageBay.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/hadphone.jpg'))),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54,
                  ),
                  child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54,
                  ),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 300,
            child: Container(
              padding: EdgeInsets.only(right: 20, left: 20, top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  Text(
                    'ร้าน',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('รับซื้อขวด',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class AppColumn extends StatelessWidget {
  const AppColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        MyStyle().CircleAvatarusersale(),
        Text(
          'ร้าน',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Text('รับซื้อขวด',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.normal))

      ],
    );
  }
}
