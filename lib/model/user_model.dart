// class UserLoginModel {
//   String? userId;
//   String? phoneNumber;
//   String? password;
//   String? typeUser;
//
//   UserLoginModel({this.userId, this.phoneNumber, this.password, this.typeUser});
//
//   UserLoginModel.fromJson(Map<String, dynamic> json) {
//     userId = json['User_id'];
//     phoneNumber = json['phone_number'];
//     password = json['password'];
//     typeUser = json['TypeUser'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['User_id'] = this.userId;
//     data['phone_number'] = this.phoneNumber;
//     data['password'] = this.password;
//     data['TypeUser'] = this.typeUser;
//     return data;
//   }
// }
// To parse this JSON data, do

    //final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  UserLoginModel({
    required this.userId,
    required this.phoneNumber,
    required this.password,
    required this.typeUser,
  });

  String userId;
  String phoneNumber;
  String password;
  String typeUser;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
    userId: json["User_id"],
    phoneNumber: json["phone_number"],
    password: json["password"],
    typeUser: json["TypeUser"],
  );

  Map<String, dynamic> toJson() => {
    "User_id": userId,
    "phone_number": phoneNumber,
    "password": password,
    "TypeUser": typeUser,
  };
}
