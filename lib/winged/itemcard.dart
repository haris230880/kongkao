import 'package:flutter/material.dart';
import 'package:project/winged/slide.dart';

import '../configs/services/api.dart';
import '../constants.dart';
import '../model/productmodel.dart';
import '../model/producttypemodel.dart';
import '../screen/USER/BAY/Product/editproduct.dart';


class ItemCard extends StatelessWidget {
  final ProductModel productModel;
  final TypeProductModel typeProductModel;
  final Function press;

  const ItemCard({
    super.key,
    required this.productModel,
    required this.press,
    required this.typeProductModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Editproduct(
                productModel: productModel,
              ),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsetsDirectional.all(kDefaultPaddin),
            height: 150,
            width: fixsixe.listViewImgSize200,
            decoration: BoxDecoration(
                color: kPrimaryblckColor,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(API.BASE_URL + productModel.productphoto),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
            child: Column(
              children: [
                Text(
                  'ชื่อ: ${productModel.productname}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'ประเภท: ${productModel.idtypeproduct}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "ราคา: ${productModel.productprice} ต่อกิโลกรัม",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}