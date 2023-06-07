import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:project/constants.dart';
import 'package:project/model/exchangebuymodel.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import '../../../../configs/services/api.dart';
import '../../../../model/exchangemodel.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key, required this.exchangemodel}) : super(key: key);

  final ExchangeModel exchangemodel;

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  // Define a list to store the entered items, their prices, weights, and total prices
  List<Map<String, dynamic>> items = [];

  void updateListOrderStatuscancel(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=สำเร็จ&exchangeid=$exchangeId');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void save(int exchangeId ,int idshop) async {
    try {
      // Convert the list of items to JSON
      List<Map<String, dynamic>> productList = items.map((item) {
        return {
          'สินค้า': item['name'],
          'ราคา': item['price'],
          'น้ำหนัก': item['weight'],
          'รวม': item['totalPrice'],
        };
      }).toList();
      // Convert the productList to a JSON string
      String productDetails = jsonEncode(productList);

      // Get the current date
      String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      // Prepare the URL with the required parameters
      String url = API.BASE_URL +
          '/kongkao/insertreceipts.php?isAdd=true&exchange_id=$exchangeId&date=$currentDate&total_amount=$exchangeId&product_details=$productDetails&idshop=$idshop';

      // Make the API request using Dio
      var response = await Dio().get(url);
      print(response);
       updateListOrderStatuscancel(exchangeId);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePageBay(), // Replace HomePage with the desired home page widget
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the total amount
    double totalAmount = items.fold(0, (sum, item) => sum + item['totalPrice']);

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
                  text: "ongkao ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ]),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                'รายการ #: ${widget.exchangemodel.exchangeid}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'วันที่: ${DateFormat('MMMM d, yyyy').format(DateTime.now())}',
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

              // Generate the list of item tiles
              items.length != 0
              ?ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      items[index]['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ราคร: \$${items[index]['price']}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'น้ำหนัก: ${items[index]['weight']} kg',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'รวม: \฿ ${items[index]['totalPrice'].toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
        :Center(child: Icon(Icons.receipt_long ,size: 300)),
              SizedBox(height: 16),
              Text(
                'รวม: \฿${totalAmount.toStringAsFixed(2)} บาท',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String itemName = '';
                        double itemPrice = 0.0;
                        double itemWeight = 0.0;

                        return AlertDialog(
                          title: Text('เพิ่มรายการ'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  itemName = value;
                                },
                                decoration: InputDecoration(
                                  labelText: 'ชื่อสินค้า',
                                ),
                              ),
                              TextField(
                                onChanged: (value) {
                                  itemPrice = double.parse(value);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'ราคา/กิโลกรัม',
                                ),
                              ),
                              TextField(
                                onChanged: (value) {
                                  itemWeight = double.parse(value);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'จำนวนกิโลกรัม',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // Calculate the total price for the item
                                  double totalPrice = itemPrice * itemWeight;

                                  // Add the entered item, price, weight, and total price to the list
                                  items.add({
                                    'name': itemName,
                                    'price': itemPrice,
                                    'weight': itemWeight,
                                    'totalPrice': totalPrice,
                                  });
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('เพิ่ม'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('เพิ่มสินค้า'),
                ),
              ),
              items.length !=0
              ?Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('ยืนยันการบันทึกข้อมูล'),
                          content: Text('คุณต้องการบันทึกข้อมูลใช่หรือไม่?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // ปิดกล่องข้อความยืนยัน
                              },
                              child: Text('ยกเลิก'),
                            ),
                            TextButton(
                              onPressed: () {
                                int exchangeId = int.parse(widget.exchangemodel.exchangeid!);
                                int idshop = int.parse(widget.exchangemodel.iduserbuy!);
                                save(exchangeId, idshop);
                                Navigator.of(context).pop(); // ปิดกล่องข้อความยืนยัน
                              },
                              child: Text('ตกลง'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Save'),
                ),
              )

            :SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
