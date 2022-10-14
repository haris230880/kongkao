import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/model/product_type_model.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/BAY/OrderScreen/OrderSreen.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';

import 'package:project/screen/USER/SALE/Home/components/backgroundhomesale.dart';
import 'package:project/screen/USER/BAY/oeder_list_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../configs/services/api.dart';
import '../../../../../future_All.dart';
import '../../Product/addproduct.dart';
import 'home_screenbay.dart';

class BodyHomePageBay extends StatefulWidget {
  const BodyHomePageBay({Key? key}) : super(key: key);

  @override
  State<BodyHomePageBay> createState() => _BodyHomePageBayState();
}

class _BodyHomePageBayState extends State<BodyHomePageBay> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getProductType();

  }
  // Future<void> getProductType() async {
  //   String path =
  //       API.BASE_URL + '/flutterApiProjeck/SELECTTypeProduct.php?isAdd=true';
  //
  //   await Dio().get(path).then((value) {
  //     print("value === $value");
  //
  //     var result = jsonDecode(value.data);
  //     int index = 0;
  //     print("result ==> $result ");
  //
  //     for (var map in result) {
  //       ProductTypeModel model = ProductTypeModel.fromJson(map);
  //       print(" imageproduct ===> ${model.protypeImage}");
  //
  //       setState(() {
  //         products.add(model);
  //         imagesproducts.add(buildbody(model, index));
  //         index++;
  //       });
  //     }
  //     // var result = json.decode(value.data);
  //     // int index = 0;
  //     // for (var map in result) {
  //     //   ProductTypeModel model = ProductTypeModel.fromJson(map);
  //     //   String _productImage = model.protypeImage;
  //
  //     // if (_productImage.isNotEmpty) {
  //     //
  //     // }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
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

      ],
    ),
        )

        );
  }

  Container HeaderHomePageBay() {
    return Container(
      margin: EdgeInsets.only(bottom: 0, top: 0),
      height: 260,
      child: Stack(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 1),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Row(
              children: [
                Text(
                  'Hi!! $username',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Phone: $userphone',
                  style: TextStyle(
                      fontSize:16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
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
                          return AddProduct();
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
  void getHttpBuyuser() async {
    try {
      var response = await Dio().get(
          API.BASE_URL + '/flutterApiProjeck/SELECTTypeProduct.php?isAdd=true');
      print(response);
    } catch (e) {
      print(e);
    }
  }


} //end
