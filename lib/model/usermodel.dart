// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.photo,
    required this.typeuser,
    required  this.password,
    required this.housenum,
    required this.district,
    required this.prefecture,
    required  this.city,
    required  this.postid,
    required  this.latitude,
    required  this.longitude,
    required  this.charge,
    required  this.shop,
    required  this.time,
  });

  String id;
  String name;
  String lastname;
  String phone;
  String email;
  String photo;
  String typeuser;
  String password;
  String housenum;
  String district;
  String prefecture;
  String city;
  String postid;
  String latitude;
  String longitude;
  String charge;
  String shop;
  String time;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
    photo: json["photo"],
    typeuser: json["typeuser"],
    password: json["password"],
    housenum: json["housenum"],
    district: json["district"],
    prefecture: json["prefecture"],
    city: json["city"],
    postid: json["postid"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    charge: json["charge"],
    shop: json["shop"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "phone": phone,
    "email": email,
    "photo": photo,
    "typeuser": typeuser,
    "password": password,
    "housenum": housenum,
    "district": district,
    "prefecture": prefecture,
    "city": city,
    "postid": postid,
    "latitude": latitude,
    "longitude": longitude,
    "charge": charge,
    "shop": shop,
    "time": time,
  };


}
