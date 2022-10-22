import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/SALE/components/exchange.dart';
import 'package:project/winged/map.dart';

import '../../BAY/HomePageBay.dart';

class ShopDetait extends StatefulWidget {
  final UserModel userModel; //รับค่า
  const ShopDetait({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ShopDetait> createState() => _ShopDetaitState();
}

class _ShopDetaitState extends State<ShopDetait> {
  late UserModel userModel; //รับค่า
  List<ProductModel> productModels = [];
  bool status = false;
  String? idshop;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel; //รับค่า
    idshop = userModel.id;

    print(idshop);
    readProduct();
  }

  Future<Null> readProduct() async {
    String url =
        API.BASE_URL + '/kongkao/showproduct.php?isAdd=true&id=$idshop';

    Response response = await Dio().get(url);
    print('response$response');
    var result = jsonDecode(response.data); //ดึงข้อมูลมา
    // print("result>>>>$result");
    if (result.toString() != 'null') {
      // print("have");
      for (var map in result) {
        ProductModel productModel = ProductModel.fromJson(map);
        setState(() {
          productModels.add(productModel);
          // productDetel.add(creatListvile(productModel));
        });
      }
    } else {
      setState(() {
        status = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text('${userModel.shop}'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 1,
              child: Container(
                width: double.maxFinite,
                height: 270,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(API.BASE_URL + userModel.photo),
                  ),
                ),
              ),
            ),
          ), //พิ้นหลัง

          SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          //color: Colors.lightGreen,
                          blurRadius: 0.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                          color: Colors.transparent, offset: Offset(5, 0)),
                      BoxShadow(color: Colors.transparent, offset: Offset(5, 0))
                    ]),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: fixsixe.screenWidth,
                      color: Colors.transparent,
                      child: Text(
                        '${userModel.shop} - ${userModel.district}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    color: kPrimaryLightColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPaddin,
                        right: kDefaultPaddin,
                        top: 15,
                        bottom: 15),
                    child: Container(
                      width: fixsixe.screenWidth,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'ค่าบริการ: ${userModel.charge}',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(1, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 25,
                                  );
                                }),
                              ),
                              Text('4.5',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    color: kPrimaryLightColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPaddin,
                        right: kDefaultPaddin,
                        top: 15,
                        bottom: 10),
                    child: Container(
                      width: fixsixe.screenWidth,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'เวลาทำการ: ${userModel.time}',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            '2.8 กม.',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: status
                      ? Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ไม่มีรายการสินค้า',
                            style: TextStyle(fontSize: 20),
                          ))
                      : showlistProduct()),
            ],
          )),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Container(
          //   padding: EdgeInsets.all(20),
          //   decoration: BoxDecoration(
          //       color: Colors.white, borderRadius: BorderRadius.circular(20)),
          //   child: Row(
          //     children: [
          //       Icon(Icons.remove),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Text('0'),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Icon(Icons.add),
          //     ],
          //   ),
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    // Foreground color
                    onPrimary: Colors.white,
                    // Background color
                    primary: kPrimaryColor,
                    minimumSize: Size(100, 50))
                .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Exchange(
                      userModel: userModel,
                    ),
                  ));
            },
            child: Text('${userModel.shop} || สั่งซื้อ'),
          ),
        ]),
      ),
    );
  }

  Container detelProduct() {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: kPrimaryColor),
    );
  }

  Widget showlistProduct() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productModels.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: fixsixe.listViewImgSize,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            API.BASE_URL + productModels[index].productphoto),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryLightColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            //color: Colors.lightGreen,
                            blurRadius: 1.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                        BoxShadow(color: Colors.white, offset: Offset(5, 0))
                      ]),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 10),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              //color: Colors.lightGreen,
                              blurRadius: 1.0,
                              offset: Offset(0, 5)),
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${productModels[index].productname}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                      'ประเภท: ${productModels[index].productname}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      )),
                                ],
                              ),
                              Text(
                                  'ราคา: ${productModels[index].productprice} บาท',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
