import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/my_style.dart';
import 'package:project/winged/map.dart';

import '../../BAY/HomePageBay.dart';

class ShopDetait extends StatefulWidget {
  final ProductModel productModel;//รับค่า

  const ShopDetait({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ShopDetait> createState() => _ShopDetaitState();
}

class _ShopDetaitState extends State<ShopDetait> {
  late ProductModel productModel;//รับค่า

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    productModel= widget.productModel;//รับค่า
  }

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
                color: kPrimaryLightColor,
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: NetworkImage(API.BASE_URL + productModel.productphoto),
                // ),
              ),
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
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back)),
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
              padding: EdgeInsets.only(right: 20, left: 20, top: 80),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'สินค้า: ${productModel.productname}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 20,
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'ประเภท: ${productModel.typeproductname}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    'ราคา: ${productModel.productprice}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 50,
            right: 50,
            bottom:300,
            top: 200,
            child: Container(
              padding: EdgeInsets.only(right: 20, left: 20, top: 20),
              decoration: BoxDecoration(

                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: NetworkImage(API.BASE_URL + productModel.productphoto),
                ),
                  borderRadius: BorderRadius.circular(20),
                ),

            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(Icons.remove),
                SizedBox(
                  width: 10,
                ),
                Text('0'),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.add),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Text('\$ ${productModel.productprice} | เพิ่มในตะกร้า'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class AppColumn extends StatelessWidget {
  const AppColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))
      ],
    );
  }
}

























