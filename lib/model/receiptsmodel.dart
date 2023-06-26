class ReceiptsModel {
  String? id;
  String? exchangeId;
  String? receiptNumber;
  String? date;
  String? totalAmount;
  String? productDetails;
  String? idshop;

  ReceiptsModel(
      {this.id,
        this.exchangeId,
        this.receiptNumber,
        this.date,
        this.totalAmount,
        this.productDetails,
        this.idshop});

  ReceiptsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exchangeId = json['exchange_id'];
    receiptNumber = json['receipt_number'];
    date = json['date'];
    totalAmount = json['total_amount'];
    productDetails = json['product_details'];
    idshop = json['idshop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exchange_id'] = this.exchangeId;
    data['receipt_number'] = this.receiptNumber;
    data['date'] = this.date;
    data['total_amount'] = this.totalAmount;
    data['product_details'] = this.productDetails;
    data['idshop'] = this.idshop;
    return data;
  }
}
