import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/BAY/oeder_list_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../configs/services/api.dart';
import '../../../../../constants.dart';
import '../../../../../future_All.dart';
import '../../../../../model/producttypemodel.dart';
import '../../../../Login/components/login_screen.dart';
import '../../HomePageBay.dart';
import '../../ProFile/body_profilebay.dart';
import '../../Product/addproduct.dart';
import 'appbarhomepagebay.dart';
import 'body_homebay.dart';

class HomeBayScreen extends StatefulWidget {
  const HomeBayScreen({Key? key}) : super(key: key);

  @override
  State<HomeBayScreen> createState() => _HomeBayScreenState();
}

class _HomeBayScreenState extends State<HomeBayScreen> {
  List<TypeProductModel> typeProductModels = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      finduser();
      readTypeProduct();
    });
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
        });
      }
    } else {
      normaDiolog(context, 'Error');
      print("nohave");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarBay(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          HeaderHomePageBay(),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text('ประเภท',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPaddin / 4),
                  height: 3,
                  width: 70,
                  color: kPrimaryLightColor
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(height: 200,
            child: GridView.builder(
                itemCount: typeProductModels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1.1,
                  mainAxisExtent: 90,
                ),
                itemBuilder: (context, index) => ItemCardType(
                    typeProductModel: typeProductModels[index])),
          ),

        ],
      ),

    );
  }

  Container HeaderHomePageBay() {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30))),
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
                      Image.asset('assets/images/box.png'),
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
}

class ItemCardType extends StatelessWidget {
  final TypeProductModel typeProductModel;
  const ItemCardType({
    super.key,
    required this.typeProductModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderListShop(),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsetsDirectional.all(kDefaultPaddin),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  // fit: BoxFit.cover,
                  image: NetworkImage(
                      API.BASE_URL + typeProductModel.typeproductcolphoto),
                )),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
            child: Column(
              children: [
                Text(
                  ' ${typeProductModel.typeproductname}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
