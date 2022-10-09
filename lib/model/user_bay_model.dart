// To parse this JSON data, do
//
//     final userBayModel = userBayModelFromJson(jsonString);

import 'dart:convert';

List<UserBayModel> userBayModelFromJson(String str) => List<UserBayModel>.from(json.decode(str).map((x) => UserBayModel.fromJson(x)));

String userBayModelToJson(List<UserBayModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserBayModel {
  UserBayModel({
    required this.buyuserId,
    required this.buyuserShop,
    required this.buyuserTime,
    required this.buyuserName,
    required this.buyuserSname,
    required this.buyuserEmail,
    required this.buyuserPhone,
    required this.buyuserPhoto,
    required this.buyuserHousenum,
    required this.buyuserDistrict,
    required this.buyuserPrefecture,
    required this.buyuserCity,
    required this.buyuserPostid,
    required this.buyuserLatitude,
    required this.buyuserLongitude,
    required this.buyuserCharge,
    required this.typeUser,
    required this.buyuserPassword,
  });

  String buyuserId;
  String buyuserShop;
  String buyuserTime;
  String buyuserName;
  String buyuserSname;
  String buyuserEmail;
  String buyuserPhone;
  String buyuserPhoto;
  String buyuserHousenum;
  String buyuserDistrict;
  String buyuserPrefecture;
  String buyuserCity;
  String buyuserPostid;
  String buyuserLatitude;
  String buyuserLongitude;
  String buyuserCharge;
  String typeUser;
  String buyuserPassword;

  factory UserBayModel.fromJson(Map<String, dynamic> json) => UserBayModel(
    buyuserId: json["buyuser_id"],
    buyuserShop: json["buyuser_shop"],
    buyuserTime: json["buyuser_time"],
    buyuserName: json["buyuser_name"],
    buyuserSname: json["buyuser_sname"],
    buyuserEmail: json["buyuser_email"],
    buyuserPhone: json["buyuser_phone"],
    buyuserPhoto: json["buyuser_photo"],
    buyuserHousenum: json["buyuser_housenum"],
    buyuserDistrict: json["buyuser_district"],
    buyuserPrefecture: json["buyuser_prefecture"],
    buyuserCity: json["buyuser_city"],
    buyuserPostid: json["buyuser_postid"],
    buyuserLatitude: json["buyuser_latitude"],
    buyuserLongitude: json["buyuser_longitude"],
    buyuserCharge: json["buyuser_charge"],
    typeUser: json["TypeUser"],
    buyuserPassword: json["buyuser_password"],
  );

  Map<String, dynamic> toJson() => {
    "buyuser_id": buyuserId,
    "buyuser_shop": buyuserShop,
    "buyuser_time": buyuserTime,
    "buyuser_name": buyuserName,
    "buyuser_sname": buyuserSname,
    "buyuser_email": buyuserEmail,
    "buyuser_phone": buyuserPhone,
    "buyuser_photo": buyuserPhoto,
    "buyuser_housenum": buyuserHousenum,
    "buyuser_district": buyuserDistrict,
    "buyuser_prefecture": buyuserPrefecture,
    "buyuser_city": buyuserCity,
    "buyuser_postid": buyuserPostid,
    "buyuser_latitude": buyuserLatitude,
    "buyuser_longitude": buyuserLongitude,
    "buyuser_charge": buyuserCharge,
    "TypeUser": typeUser,
    "buyuser_password": buyuserPassword,
  };
}
