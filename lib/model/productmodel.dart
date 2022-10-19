// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.productid,
    required this.productname,
    required this.productprice,
    required this.productphoto,
    required this.typeproductname,
    required this.idtypeproduct,
  });

  String productid;
  String productname;
  String productprice;
  String productphoto;
  String typeproductname;
  String idtypeproduct;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productid: json["productid"],
    productname: json["productname"],
    productprice: json["productprice"],
    productphoto: json["productphoto"],
    typeproductname: json["typeproductname"],
    idtypeproduct: json["idtypeproduct"],
  );

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "productname": productname,
    "productprice": productprice,
    "productphoto": productphoto,
    "typeproductname": typeproductname,
    "idtypeproduct": idtypeproduct,
  };
}
