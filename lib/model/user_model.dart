// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

List<UserLoginModel> userLoginModelFromJson(String str) => List<UserLoginModel>.from(json.decode(str).map((x) => UserLoginModel.fromJson(x)));

String userLoginModelToJson(List<UserLoginModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoginModel {
  UserLoginModel({
    required this.phoneNumber,
    required this.password,
    required this.typeUser,
    required this.token,
    this.useridbay,
    this.useridsale,
  });

  String phoneNumber;
  String password;
  String typeUser;
  String token;
  dynamic useridbay;
  dynamic useridsale;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
    phoneNumber: json["phone_number"],
    password: json["password"],
    typeUser: json["TypeUser"],
    token: json["Token"],
    useridbay: json["useridbay"],
    useridsale: json["useridsale"],
  );

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    "password": password,
    "TypeUser": typeUser,
    "Token": token,
    "useridbay": useridbay,
    "useridsale": useridsale,
  };
}
