//
//
// // To parse this JSON data, do
// //
// //     final productModel = productModelFromJson(jsonString);
//
// import 'dart:convert';
//
// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
//
// String productModelToJson(ProductModel data) => json.encode(data.toJson());
//
// class ProductModel {
//   ProductModel({
//     required this.productId,
//     required this.productName,
//     required this.productPhoto,
//     required this.productPrice,
//     required this.protypeName,
//   });
//
//   String productId;
//   String productName;
//   String productPhoto;
//   String productPrice;
//   String protypeName;
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//     productId: json["product_id"],
//     productName: json["product_name"],
//     productPhoto: json["product_photo"],
//     productPrice: json["product_price"],
//     protypeName: json["protype_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product_id": productId,
//     "product_name": productName,
//     "product_photo": productPhoto,
//     "product_price": productPrice,
//     "protype_name": protypeName,
//   };
// }
