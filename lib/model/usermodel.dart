class UserModel {
  String? id;
  String? name;
  String? lastname;
  String? phone;
  String? email;
  String? photo;
  String? typeuser;
  String? password;
  String? housenum;
  String? district;
  String? prefecture;
  String? city;
  String? postid;
  String? latitude;
  String? longitude;
  String? charge;
  String? shop;
  String? time;

  UserModel(
      {this.id,
        this.name,
        this.lastname,
        this.phone,
        this.email,
        this.photo,
        this.typeuser,
        this.password,
        this.housenum,
        this.district,
        this.prefecture,
        this.city,
        this.postid,
        this.latitude,
        this.longitude,
        this.charge,
        this.shop,
        this.time});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    typeuser = json['typeuser'];
    password = json['password'];
    housenum = json['housenum'];
    district = json['district'];
    prefecture = json['prefecture'];
    city = json['city'];
    postid = json['postid'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    charge = json['charge'];
    shop = json['shop'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['typeuser'] = this.typeuser;
    data['password'] = this.password;
    data['housenum'] = this.housenum;
    data['district'] = this.district;
    data['prefecture'] = this.prefecture;
    data['city'] = this.city;
    data['postid'] = this.postid;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['charge'] = this.charge;
    data['shop'] = this.shop;
    data['time'] = this.time;
    return data;
  }
}
