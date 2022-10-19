import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/model/producttypemodel.dart';
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
  List<TypeProductModel> typeProductModels = [];

  Future<Null> readTypeProduct() async {
    String url = API.BASE_URL + '/kongkao/showtypeproduct.php?isAdd=true';

    Response response = await Dio().get(url);
    print('response$response');
    var result = jsonDecode(response.data); //ดึงข้อมูลมา
    // print("result>>>>$result");
    if (result.toString() != 'null') {
      // print("have");
      for (var map in result) {
        TypeProductModel typeProductModel = TypeProductModel.fromJson(map);
        setState(() {
          typeProductModels.add(typeProductModel);
        });
      }
    } else {
      normaDiolog(context, 'Error');
      print("nohave");
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    readTypeProduct();
    print(typeProductModels);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          HeaderHomePageBay(),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Categories()
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                      Container(
                        height: fixsixe.witht80,
                        width: fixsixe.height80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('text'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(height: fixsixe.height250,
                    child: ListView.builder(
                      itemCount: typeProductModels.length,
                      itemBuilder: (context, index) {
                        return Text('${typeProductModels[index].typeproductname}');
                      },
                    ),
                  ),

                  // ListView.builder(
                  //    physics: NeverScrollableScrollPhysics(),
                  //    shrinkWrap: true,
                  //    itemCount: TypeProductModels.length,
                  //    itemBuilder: (context, index) {
                  //      return Container(
                  //        margin: EdgeInsets.only(left: 20, right: 20),
                  //        child: Row(
                  //          children: [
                  //            Container(
                  //              margin: EdgeInsets.only(top: 10),
                  //              width: Dimensions.listViewImgSize,
                  //              height: Dimensions.listViewImgSize,
                  //              decoration: BoxDecoration(
                  //                borderRadius: BorderRadius.circular(20),
                  //                color: kPrimaryColor,
                  //                image: DecorationImage(
                  //                  fit: BoxFit.cover,
                  //                  image: NetworkImage(API.BASE_URL+productModels[index].productphoto),
                  //                ),
                  //              ),
                  //            ),
                  //
                  //            Expanded(
                  //              child: Container(
                  //                margin: EdgeInsets.only(top: 15),
                  //                height: Dimensions.listviewTextContSize,
                  //                width: Dimensions.listviewTextContSize,
                  //                decoration: BoxDecoration(
                  //                  borderRadius: BorderRadius.circular(20),
                  //                  color: kPrimaryLightColor,
                  //                ),
                  //                child: Padding(
                  //                  padding: EdgeInsets.only(left: 10, right: 10),
                  //                  child: Column(
                  //                    crossAxisAlignment: CrossAxisAlignment.start,
                  //                    mainAxisAlignment: MainAxisAlignment.center,
                  //                    children: [
                  //                      Text('ชื่อ: ${productModels[index].productname}',
                  //                        style: TextStyle(
                  //                            fontSize: 20,
                  //                            fontWeight: FontWeight.bold),
                  //                      ),
                  //                      SizedBox(
                  //                        height: 8,
                  //                      ),
                  //                      Text('ราคา: ${productModels[index].productprice}',
                  //                          style: TextStyle(
                  //                              fontSize: 15,
                  //                              fontWeight: FontWeight.normal))
                  //                    ],
                  //                  ),
                  //                ),
                  //              ),
                  //            )
                  //          ],
                  //        ),
                  //      );
                  //    })
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
      height: 200,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 10),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Row(
              children: [
                Text(
                  'Hi!!}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Shop:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
                height: 70,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: kPrimaryColor.withOpacity(0.1)),
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
