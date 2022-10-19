// To parse this JSON data, do
//
//     final typeProductModel = typeProductModelFromJson(jsonString);

import 'dart:convert';

List<TypeProductModel> typeProductModelFromJson(String str) => List<TypeProductModel>.from(json.decode(str).map((x) => TypeProductModel.fromJson(x)));

String typeProductModelToJson(List<TypeProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeProductModel {
  TypeProductModel({
    required this.idtypeproduct,
    required this.typeproductname,
    required this.typeproductcolphoto,
  });

  String idtypeproduct;
  String typeproductname;
  String typeproductcolphoto;

  factory TypeProductModel.fromJson(Map<String, dynamic> json) => TypeProductModel(
    idtypeproduct: json["idtypeproduct"],
    typeproductname: json["typeproductname"],
    typeproductcolphoto: json["typeproductcolphoto"],
  );

  Map<String, dynamic> toJson() => {
    "idtypeproduct": idtypeproduct,
    "typeproductname": typeproductname,
    "typeproductcolphoto": typeproductcolphoto,
  };
}
