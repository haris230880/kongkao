import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/exchangebuymodel.dart';
import 'package:project/model/receiptsmodel.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/SALE/components/Assessment.dart';
import '../../../../configs/services/api.dart';
import '../../../../model/exchangemodel.dart';

class ShowReceiptPageSale extends StatefulWidget {
  const ShowReceiptPageSale({Key? key, required this.exchangemodel}) : super(key: key);

  final ExchangeModel exchangemodel;

  @override
  State<ShowReceiptPageSale> createState() => _ShowReceiptPageSaleState();
}

class _ShowReceiptPageSaleState extends State<ShowReceiptPageSale> {
  List<ReceiptsModel> receiptsModels = [];
var sts =true;
  @override
  void initState() {
    super.initState();
    showreceipts();
  }

  Future<Null> showreceipts() async {
    String url = API.BASE_URL +
        '/kongkao/showreceiptssale.php?isAdd=true&exchange_id=${widget.exchangemodel.exchangeid}';

    Response response = await Dio().get(url);
    print('response$response');
    var result = jsonDecode(response.data);

    if (result.toString() != 'null') {
      receiptsModels = List<ReceiptsModel>.from(result.map((map) => ReceiptsModel.fromJson(map)));
      setState(() {sts=false;});

    } else {
      normaDiolog(context, 'Error');
      print("nohave");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Row(
          children: [
            RichText(
              textAlign: TextAlign.right,
              text: TextSpan(children: [
                TextSpan(
                  text: "K",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                TextSpan(
                  text: "ongkao",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ]),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Assessment(exchangemodel: widget.exchangemodel)),
              );
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body:sts ?Center(child: CircularProgressIndicator(backgroundColor: kPrimaryColor,))

      :SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'ใบเสร็จ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'รายการ #${receiptsModels[0].id} ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${receiptsModels[0].date}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'รายการ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: receiptsModels.length,
                itemBuilder: (context, index) {
                  ReceiptsModel receipt = receiptsModels[index];

                  List<dynamic> productDetails = jsonDecode(receipt.productDetails!);

                  return ListTile(
                    title: Text(
                      'รายละเอียด:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: productDetails.map((item) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('สินค้า: ${item['สินค้า']}'),
                            Text('ราคา: ${item['ราคา']} บาท'),
                            Text('น้ำหนัก: ${item['น้ำหนัก']} กิโลกรัม'),
                            Text('รวม: ${item['รวม']} บาท'),
                            SizedBox(height: 10), // Add some vertical spacing between each item
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Text(
                'รวมหลังหักค่าบริการ: ${receiptsModels[0].totalAmount} บาท',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      )
    );
  }
}


