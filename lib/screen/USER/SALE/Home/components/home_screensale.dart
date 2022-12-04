import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/model/producttypemodel.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/SALE/components/showtype.dart';
import '../../../../../configs/services/api.dart';
import '../../../../../constants.dart';
import '../../../../../future_All.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../winged/seacrch.dart';
import '../../components/shopdetait.dart';


class HomeScreensale extends StatefulWidget {
  const HomeScreensale({Key? key}) : super(key: key);

  @override
  State<HomeScreensale> createState() => _HomeScreensaleState();
}

class _HomeScreensaleState extends State<HomeScreensale> {

  List<TypeProductModel> typeProductModels = [];
  List<ProductModel> productModels = [];
  List<UserModel> userModels = [];

  bool status = true;

  @override
  void initState() {
    super.initState();

    readTypeProduct();
    readProduct();
    readUser();
    pageController.addListener(
      () {
        setState(
          () {
            _currPageValue = pageController.page!;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
  }

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
          status = false;
        });
      }
    } else {
      normaDiolog(context, 'Error');
      print("nohave");
    }
  }

  Future<Null> readProduct() async {
    String url = API.BASE_URL + '/kongkao/showproductAll.php?isAdd=true';

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
        status = false;
      });
      print("nohave");
    }
  }

  Future<Null> readUser() async {
    String url = API.BASE_URL + '/kongkao/showusershop.php?isAdd=true';

    Response response = await Dio().get(url);
    print('response$response');
    var result = jsonDecode(response.data); //ดึงข้อมูลมา
    // print("result>>>>$result");
    if (result.toString() != 'null') {
      // print("have");
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        setState(() {
          userModels.add(userModel);

          // productDetel.add(creatListvile(productModel));
        });
      }
    } else {
      setState(() {
        status = false;
      });
      print("nohave");
    }
  }

  PageController pageController = PageController(viewportFraction: 0.90);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = fixsixe.pageViewContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarybackgron,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/images/logo.jpg')),
            SizedBox(
              width: 10,
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
                  text: "ongkao",
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
          IconButton(
              onPressed: () {
                // showSearch(
                //   context: context,
                //   delegate: MySearchDelegate(),
                // );
                Navigator.push(context, MaterialPageRoute(builder: (context) => Seacechpage(),));
              },
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
              )),


          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );

              },
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
              )),


        ],
      ),
      body: status
          ? MyStyle().showProgress()
          : SingleChildScrollView(
              child: Column(
                children: [
                  paheVile(),
                  DotsIndicator(
                    dotsCount: typeProductModels.length,
                    position: _currPageValue,
                    decorator: DotsDecorator(
                      activeColor: kPrimaryColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('สินค้า', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  // showlistProduct(),//showสินค้า
                  showlistUser(),//showร้าน
                ],
              ),
            ),
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
            child: TextButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => ShopDetait(
                    userModel: userModels[index],
                  ),
                ); //ส้งค่า
                Navigator.push(context, route);
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: fixsixe.listViewImgSize,
                    height: fixsixe.listViewImgSize,
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
                      height: fixsixe.listViewImgSize,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                //color: Colors.lightGreen,
                                blurRadius: 1.0,
                                offset: Offset(0, 5)),
                            BoxShadow(
                                color: Colors.white, offset: Offset(-5, 0)),
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
                                Text('ร้าน: ${productModels[index].shop}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    )),
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
            ),
          );
        });
  }

  Widget showlistUser() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: userModels.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => ShopDetait(
                    userModel: userModels[index],
                  ),
                ); //ส้งค่า
                Navigator.push(context, route);
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: fixsixe.listViewImgSize,
                    height: fixsixe.listViewImgSize,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              API.BASE_URL + userModels[index].photo),
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
                      height: fixsixe.listViewImgSize,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                //color: Colors.lightGreen,
                                blurRadius: 1.0,
                                offset: Offset(0, 5)),
                            BoxShadow(
                                color: Colors.white, offset: Offset(-5, 0)),
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
                                  '${userModels[index].shop}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('ค่าบริการ: ${userModels[index].charge}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    )),
                                Text('เวลาทำการ: ${userModels[index].time}',
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
            ),
          );
        });
  }

  Widget paheVile() {
    return Container(
      height: fixsixe.pageView,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        itemCount: typeProductModels.length,
        itemBuilder: (context, position) {
          return _buildpageItem(position);
        },
      ),
    );
  }

  Widget _buildpageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowList(
                  typeProductModel: typeProductModels[index],
                ),
              ));
        },
        child: Stack(
          children: [
            Container(
              height: fixsixe.pageViewContainer,
              margin: EdgeInsets.only(left: 5, right: 5, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? kPrimaryColor : kPrimaryLightColor,
                image: DecorationImage(
                  // fit: BoxFit.cover,
                  image: NetworkImage(API.BASE_URL +
                      typeProductModels[index].typeproductcolphoto),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: fixsixe.pageViewTextContainer,
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
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
                child: Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${typeProductModels[index].typeproductname}',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 15,
                              );
                            }),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





