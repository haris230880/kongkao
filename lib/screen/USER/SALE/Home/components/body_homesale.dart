//import 'dart:html';//เม้น

import 'dart:io';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/USER/BAY/HOME/components/home_screenbay.dart';
import 'package:project/screen/USER/SALE/Home/components/backgroundhomesale.dart';
import 'package:project/screen/USER/SALE/Home/components/productdetle.dart';
import 'package:project/winged/dimesions.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/winged/categoryitemmanu.dart';
import 'package:project/future_All.dart';
import 'package:project/winged/searchbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyHomePageSall extends StatefulWidget {
  const BodyHomePageSall({Key? key}) : super(key: key);
  @override
  State<BodyHomePageSall> createState() => _BodyHomePageSallState();
}

class _BodyHomePageSallState extends State<BodyHomePageSall> {
  PageController pageController = PageController(viewportFraction: 0.90);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageSell(
      child: SingleChildScrollView(
        child: Column(
          children: [
            paheVile(),
           new DotsIndicator(
              dotsCount: 5,
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ร้านค้า', style: TextStyle(fontSize: 18)),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(),));
                  }, child: Text('สินค้า'),
                  )
                ],
              ),
            ),
            //List of food and images
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/hadphone.jpg'),
                            ),

                          ),
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 15),
                            height: Dimensions.listviewTextContSize,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)
                              ),
                              color: kPrimaryLightColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text('ฮาริสการค้า', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8,),
                                  Text('รับซื้อขวด', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),

           // Expanded(
           //   child: SingleChildScrollView(
           //     child: FoodPageBody(),
           //   ),
           // )
          ],
        ),
      ),
    );
  }

  Container FoodPageBody() {
    return Container(
             child:  ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                 itemCount: 20,
                 itemBuilder: (context, index) {
                   return Container(
                     margin: EdgeInsets.only(left: 20, right: 20),
                     child: Row(
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 10),
                           width: Dimensions.listViewImgSize,
                           height: Dimensions.listViewImgSize,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: kPrimaryColor,
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: AssetImage('assets/images/hadphone.jpg'),
                             ),
                           ),
                         ),

                         Expanded(
                           child: Container(
                             margin: EdgeInsets.only(top: 15),
                             height: Dimensions.listviewTextContSize,
                             width: 200,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(20),
                                 bottomRight: Radius.circular(20)
                               ),
                               color: kPrimaryLightColor,
                             ),
                             child: Padding(
                               padding: EdgeInsets.only(left: 10,right: 10),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [

                                   Text('ฮาริสการค้า', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                   ),
                                   SizedBox(height: 8,),
                                   Text('รับซื้อขวด', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))
                                 ],
                               ),
                             ),
                           ),
                         )
                       ],
                     ),
                   );
                 }),
           );
  }

  Container paheVile() {
    return Container(
      height: Dimensions.pageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
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
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 5, right: 5, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? kPrimaryColor : kPrimaryLightColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/Pinterestpg.jpg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: kPrimaryLightColor,
                        //color: Colors.lightGreen,
                        blurRadius: 3.0,
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
                      'สินค้า',
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
