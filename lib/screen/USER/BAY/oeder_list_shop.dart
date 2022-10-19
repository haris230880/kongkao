import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/model/producttypemodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/BAY/Product/addproduct.dart';
import 'package:project/screen/USER/BAY/Product/editproduct.dart';
import 'package:project/screen/USER/SALE/components/productdetle.dart';
import 'package:project/winged/itemcard.dart';

class OrderListShop extends StatefulWidget {
  const OrderListShop({Key? key}) : super(key: key);

  @override
  State<OrderListShop> createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {
  List<ProductModel> productModels = [];
  // List<TypeProductModel> typeproductmodels = [];

  List<Widget> productitem = [];
  bool status = true;
  bool lodestatus = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readProduct();
    // readTypeProduct();
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
          productitem.add(creatCard(productModel));
        });
      }
    } else {
      setState(() {
        status = false;
      });
      print("nohave");
    }
  }

  // Future<Null> readTypeProduct() async {
  //   String url = API.BASE_URL + '/kongkao/showtypeproduct.php?isAdd=true';
  //
  //   Response response = await Dio().get(url);
  //   //print('response$response');
  //   var result = jsonDecode(response.data); //ดึงข้อมูลมา
  //   //print("result>>>>$result");
  //   if (result.toString() != 'null') {
  //     // print("have");
  //     for (var map in result) {
  //       TypeProductModel typeProductModel = TypeProductModel.fromJson(map);
  //       setState(() {
  //         typeproductmodels.add(typeProductModel);
  //       });
  //     }
  //   } else {
  //     normaDiolog(context, 'Error');
  //     print("nohave");
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    print("width ==> " + MediaQuery.of(context).size.width.toString());
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
                    builder: (context) => ShopDetait(),
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
      body: Padding(
        padding: const EdgeInsets.all(6.0),
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

            productitem.length == 0
                ? MyStyle().showProgress()
                : Expanded(
                    child: SizedBox(
                      height: 190,
                      child: GridView.extent(
                        maxCrossAxisExtent: 180,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        children: productitem,
                      ),
                    ),
                  ),


          ],
        ),
      ),
    );
  }




  Widget creatCard(ProductModel productModel) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(API.BASE_URL + productModel.productphoto),
                )),

          ),
          Text(productModel.productname),
          Text('ราคา ${productModel.productprice}'),
          Text('ประเภท ${productModel.typeproductname}'),
        ],
      ),
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
