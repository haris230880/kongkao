class ProductTypeModel {
  String? protypeId;
  String? protypeName;
  String? protypeImage;

  ProductTypeModel({this.protypeId, this.protypeName, this.protypeImage});

  ProductTypeModel.fromJson(Map<String, dynamic> json) {
    protypeId = json['protype_id'];
    protypeName = json['protype_name'];
    protypeImage = json['protype_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protype_id'] = this.protypeId;
    data['protype_name'] = this.protypeName;
    data['protype_image'] = this.protypeImage;
    return data;
  }
}
