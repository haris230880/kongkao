import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/model/producttypemodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/BAY/Product/addproduct.dart';
import 'package:project/screen/USER/BAY/Product/editproduct.dart';
import 'package:project/screen/USER/SALE/components/shopdetait.dart';
import 'package:project/winged/itemcard.dart';

class OrderListShop extends StatefulWidget {



  const OrderListShop({Key? key}) : super(key: key);

  @override
  State<OrderListShop> createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {
  List<UserModel> userModels =[];

  List<Widget> productitem = [];

  double? lat1, lng1, lat2, lng2, distincd;
  String? distincdString,	exphoto;

  bool status = true;
  bool lodestatus = true;
  int? transport,sum;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readProduct();

  }
  Future<Null> readProduct() async {
    if (productitem.length != 0){
      productitem.clear();
    }
    String url =
        API.BASE_URL + '/kongkao/showproduct.php?isAdd=true&id=$userid';
    await Dio().get(url).then((value)  {
      setState(() {
        lodestatus =  false;
      });
      if(value.toString()!= 'null'){
        var result = jsonDecode(value.data);
        for (var map in result){
          ProductModel productModel = ProductModel.fromJson(map);
          setState(() {
            // productModels.add(productModel);
            productitem.add(creatCard(productModel));
            status = false;
          });

        }

      } else{
        setState(() {
          status = true;
        });
      }

        });
  }

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
                    builder: (context) => AddProduct(),
                  )).then((value) => readProduct());
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
            lodestatus
                ? Column(
                    children: [
                      Center(
                        child: Text(
                          'ไม่มีสินค้า',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : status
                    ? MyStyle().showProgress()
                    : Expanded(
                        child: SizedBox(
                          height: 190,
                          child: GridView.extent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
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
      child: TextButton(
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => Editproduct(
              productModel: productModel,
            ),
          );
          Navigator.push(context, route).then(
                (value) => readProduct(),
          );



        },

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
            Text('ราคา ${productModel.productprice}',
                style: TextStyle(
                  color: kPrimaryblckColor,
                )),
            Text('ประเภท ${productModel.typeproductname}',
                style: TextStyle(color: kPrimaryblckColor, fontSize: 16)),
          ],
        ),
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
