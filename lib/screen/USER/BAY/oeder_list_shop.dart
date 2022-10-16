import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/BAY/Product/addproduct.dart';
import 'package:project/screen/USER/SALE/Home/components/productdetle.dart';

import '../../../winged/dimesions.dart';

class OrderListShop extends StatefulWidget {
  const OrderListShop({Key? key}) : super(key: key);

  @override
  State<OrderListShop> createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {
  List<ProductModel> productModels = [];
  bool status = true;
  bool lodestatus = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readProduct();
  }

  Future<Null> readProduct() async {
    String url =
        API.BASE_URL + '/kongkao/showproduct.php?isAdd=true&id=$userid';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(),
                  ));
            },
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProduct(),
                  ));
            },
            icon: Icon(Icons.add_box),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text(
                'shop',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Categories(),
            // Container(
            //   height: 800,
            //   child:Center(
            //     child:  lodestatus ? showContrnt() :  showContrnt()
            // ),),
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
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(API.BASE_URL+productModels[index].productphoto),
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
                                  bottomRight: Radius.circular(20)),
                              color: kPrimaryLightColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(productModels[index].productname,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('ราคา ${productModels[index].productprice}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })


            //ItemCard(),
            // ItemCard(),
          ],
        ),
      ),
    );
  }

  Widget showContrnt() {
    return  status
          ? showListProduct()
          : Center(
              child: Text('ไม่มีราบการสินค้า'),

    );
  }

  Widget showListProduct() => ListView.builder(
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
                          'ฮาริสการค้า',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('รับซื้อขวด',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });

  Column ItemCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsetsDirectional.all(kDefaultPaddin),
          height: 180,
          width: 160,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset('assets/icons/userbay.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            'products',
            style: TextStyle(fontSize: 12),
          ),
        ),
        Text(
          "\$123",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "พลาสติก",
    "กระดาษ",
    "อลูมิเนียม",
    "แก้ว",
    "อื่น ๆ",
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildText(index),
      ),
    );
  }

  Widget buildText(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      selectIndex == index ? kPrimaryColor : kPrimaryblckColor),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 3,
              width: 30,
              color: selectIndex == index
                  ? kPrimaryLightColor
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
