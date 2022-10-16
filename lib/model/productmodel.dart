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
    required this.idtypeproduct,
    required this.id,
  });

  String productid;
  String productname;
  String productprice;
  String productphoto;
  String idtypeproduct;
  String id;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productid: json["productid"],
    productname: json["productname"],
    productprice: json["productprice"],
    productphoto: json["productphoto"],
    idtypeproduct: json["idtypeproduct"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "productname": productname,
    "productprice": productprice,
    "productphoto": productphoto,
    "idtypeproduct": idtypeproduct,
    "id": id,
  };
}
