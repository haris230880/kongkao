class ExchangeModel {
  String? exchangeid;
  String? iduserbuy;
  String? idusersale;
  String? exphoto;
  String? distance;
  String? transport;
  String? total;
  String? detail;
  String? status;
  String? date;
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

  ExchangeModel(
      {this.exchangeid,
        this.iduserbuy,
        this.idusersale,
        this.exphoto,
        this.distance,
        this.transport,
        this.total,
        this.detail,
        this.status,
        this.date,
        this.id,
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

  ExchangeModel.fromJson(Map<String, dynamic> json) {
    exchangeid = json['exchangeid'];
    iduserbuy = json['iduserbuy'];
    idusersale = json['idusersale'];
    exphoto = json['exphoto'];
    distance = json['distance'];
    transport = json['transport'];
    total = json['total'];
    detail = json['detail'];
    status = json['status'];
    date = json['date'];
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
    data['exchangeid'] = this.exchangeid;
    data['iduserbuy'] = this.iduserbuy;
    data['idusersale'] = this.idusersale;
    data['exphoto'] = this.exphoto;
    data['distance'] = this.distance;
    data['transport'] = this.transport;
    data['total'] = this.total;
    data['detail'] = this.detail;
    data['status'] = this.status;
    data['date'] = this.date;
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
