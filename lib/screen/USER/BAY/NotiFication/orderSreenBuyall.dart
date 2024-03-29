import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/future_All.dart';
import 'package:project/model/exchangemodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/screen/USER/BAY/HOME/components/appbarhomepagebay.dart';
import 'package:project/screen/USER/BAY/NotiFication/showreceipt.dart';
import 'package:project/screen/USER/BAY/OrderScreen/detailsScreen.dart';
import 'package:project/screen/USER/SALE/ProFile/editprofile.dart';

import '../../../../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderScreenBuyALL extends StatefulWidget {
  const OrderScreenBuyALL({Key? key}) : super(key: key);

  @override
  State<OrderScreenBuyALL> createState() => _OrderScreenBuyALLState();
}

class _OrderScreenBuyALLState extends State<OrderScreenBuyALL> {
  List<ExchangeModel> exchangemodels = [];

  @override
  void initState() {
    super.initState();
    readlistorder();
  }

  Future<void> readlistorder() async {
    print(userid);
    try {
      final url = API.BASE_URL +
          '/kongkao/showlistorderbuy.php?isAdd=true&iduserbuy=$userid&orderBy=date DESC';
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.data);
        if (result != null) {
          for (final map in result) {
            final exchangemodel = ExchangeModel.fromJson(map);

            setState(() {
              exchangemodels.add(exchangemodel);
            });
          }
        } else {
          normaDiolog(context, 'ไม่พบรายการ');
        }
      } else {
        normaDiolog(context, 'Error');
      }
    } catch (e) {
      normaDiolog(context, 'Error: $e');
    }
  }

  void updateListOrderStatus(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=สำเร็จ&exchangeid=$exchangeId');
      print(response);

      setState(() {
        exchangemodels = [];
      });

      await readlistorder(); // อัพเดท UI ด้วยข้อมูลใหม่
    } catch (e) {
      print(e);
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
              CircleAvatar(
                minRadius: 20,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/icons/userbay.png',
                  scale: 10,
                ),
              ),
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
          actions: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'ประวัติ',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                  ],
                ))

          ],
        ),
        body: ListView.builder(
          itemCount: exchangemodels.length,
          itemBuilder: (context, index) {
            if (exchangemodels[index].status != "null") {
              return GestureDetector(
                onTap: () {
                if(  exchangemodels[index].status == "สำเร็จ")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShowReceiptPage(exchangemodel: exchangemodels[index]),
                      ),
                    );
                  }
                },
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  API.BASE_URL + exchangemodels[index].photo!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                exchangemodels[index].date!,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.grey.shade700),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    exchangemodels[index].name!,
                                    style: TextStyle(fontSize: 14),
                                  ),

                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.home_filled,
                                    size: 14,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    exchangemodels[index].district!,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${exchangemodels[index].status! == 'สำเร็จ'
                                    ? ('สำเร็จ')
                                    : exchangemodels[index].status! == 'ยกเลิก'
                                    ? ('ยกเลิก')
                                    : ('กำลังดำเนินการ')}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: exchangemodels[index].status ==
                                      "สำเร็จ"
                                      ? kPrimaryColor
                                      : exchangemodels[index].status == "ยกเลิก"
                                      ? Colors.red
                                      : Colors.orangeAccent,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              Text('\$ ${exchangemodels[index].total!}'),
                              exchangemodels[index].status == "สำเร็จ"
                                  ? Text('ใบเสร็จ')
                                  : SizedBox.shrink(),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }else {
            return SizedBox.shrink(); // ไม่แสดงรายการที่ไม่ได้กำลังดำเนินการ
            }
          },
        ));
  }
}
