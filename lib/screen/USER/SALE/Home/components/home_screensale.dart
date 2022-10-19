import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/model/producttypemodel.dart';
import 'package:project/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../configs/services/api.dart';
import '../../../../../constants.dart';
import '../../../../../future_All.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../winged/itemcard.dart';
import '../../../BAY/Product/editproduct.dart';
import '../../components/productdetle.dart';
import 'appbarhomepagesale.dart';
import 'body_homesale.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  // List<UserModel> usermodels = [];
  List<TypeProductModel> typeProductModels = [];
  List<ProductModel> productModels = [];
bool status = true;

  @override
  void initState() {
    super.initState();
    // readUserbuy();
    readTypeProduct();
    readProduct();

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


  // Future<Null> readUserbuy() async {
  //   String url =
  //       API.BASE_URL + '/kongkao/showusershop.php?isAdd=true';
  //
  //   Response response = await Dio().get(url);
  //   // print('response$response');
  //   var result = jsonDecode(response.data); //ดึงข้อมูลมา
  //   if (result.toString() != 'null') {
  //     for (var map in result) {
  //       print(result);
  //       UserModel userModel = UserModel.fromJson(map);
  //       setState(() {
  //         usermodels.add(userModel);
  //       });
  //     }
  //   } else {
  //     normaDiolog(context, 'Error');
  //   }
  // }
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
    String url =
        API.BASE_URL + '/kongkao/showproductAll.php?isAdd=true';

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
      appBar: HomeAppBarSall(),
      body: status ? MyStyle().showProgress()
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
                  Text('ร้านค้า', style: TextStyle(fontSize: 18)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopDetait(),
                          ));
                    },
                    child: Text('สินค้า'),
                  )
                ],
              ),
            ),
            //List of food and images
            // Expanded(
            //   child: SizedBox(
            //     height: 100,
            //     child: GridView.builder(
            //       itemCount: productModels.length,
            //       gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: kDefaultPaddin,
            //         crossAxisSpacing: kDefaultPaddin,
            //         childAspectRatio: 0.65,
            //       ),
            //       itemBuilder: (context, index) => Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: <Widget>[
            //           Container(
            //             padding: EdgeInsetsDirectional.all(kDefaultPaddin),
            //             height: 150,
            //             width: fixsixe.listViewImgSize200,
            //             decoration: BoxDecoration(
            //                 color: kPrimaryblckColor,
            //                 borderRadius: BorderRadius.circular(16),
            //                 image: DecorationImage(
            //                   fit: BoxFit.cover,
            //                   image: NetworkImage(API.BASE_URL + productModels[index].productphoto),
            //                 )),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
            //             child: Column(
            //               children: [
            //                 Text(
            //                   'ชื่อ: ${productModels[index].productname}',
            //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //                 ),
            //                 Text(
            //                   'ประเภท: ${productModels[index].idtypeproduct}',
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //                 Text(
            //                   "ราคา: ${productModels[index].productprice} ต่อกิโลกรัม",
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),


            ListView.builder(
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
                          height: fixsixe.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(API.BASE_URL + productModels[index].productphoto),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 15),
                            height: fixsixe.listviewTextContSize,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: kPrimaryLightColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    productModels[index].productname,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('เวลา: ${productModels[index].productprice}   ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal)),
                                  Text('ค่าบริการ: ${productModels[index].typeproductname} บาท ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),

        ],
      ),
          ),
    );
  }


  Container paheVile() {
    return Container(
      height: fixsixe.pageView,
      child: PageView.builder(
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
                image: NetworkImage(API.BASE_URL+typeProductModels[index].typeproductcolphoto),
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
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
    );
  }
}
