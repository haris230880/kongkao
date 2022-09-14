class UserLoginModel {
  String? userId;
  String? phoneNumber;
  String? password;
  String? typeUser;

  UserLoginModel({this.userId, this.phoneNumber, this.password, this.typeUser});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['User_id'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    typeUser = json['TypeUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['TypeUser'] = this.typeUser;
    return data;
  }
}
