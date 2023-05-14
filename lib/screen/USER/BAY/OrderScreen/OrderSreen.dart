import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/future_All.dart';
import 'package:project/model/exchangemodel.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/screen/USER/BAY/HOME/components/appbarhomepagebay.dart';
import 'package:project/screen/USER/BAY/OrderScreen/BodyOrder.dart';
import 'package:project/screen/USER/SALE/ProFile/editprofile.dart';

import '../../../../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;






class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  List<ExchangeModel> exchangemodels = [];

  @override
  void initState() {
    super.initState();
    readlistorder();
  }

  Future<void> readlistorder() async {
    try {
      final url = API.BASE_URL + '/kongkao/showlistorder.php?isAdd=true&idsale=$userid';
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
          normaDiolog(context, 'No data found');
        }
      } else {
        normaDiolog(context, 'Error');
      }
    } catch (e) {
      normaDiolog(context, 'Error: $e');
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
                  Text('ประวัติ', style: TextStyle(color: Colors.white),),
                  SizedBox(width: 5,),
                  Icon(Icons.history, color: Colors.white,),
                ],
              ))
          // Container(
          //   child: Row(
          //     children: [
          //       Text('ประวัติคำสั่งซื้อ'),
          //       IconButton(onPressed: () {}, icon: Icon(Icons.history)),
          //     ],
          //   ),
          // )
        ],
      ),
      body:  ListView.builder(
        itemCount: exchangemodels.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child:
                  Container(
                    height: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(API.BASE_URL + exchangemodels[index].photo!),
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
                            color: Colors.grey.shade700
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(children: [
                          Icon(Icons.location_on,size: 14,color: Colors.redAccent, ),
                          SizedBox(width: 8,),
                          Text(
                            exchangemodels[index].shop!,
                            style: TextStyle(
                            fontSize: 14
                            ),
                          ),
                        ],),
                        SizedBox(height: 8),
                        Row(children: [
                          Icon(Icons.home_filled,size: 14,color: kPrimaryColor,),
                          SizedBox(width: 8,),
                          Text(
                            exchangemodels[index].district!,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),

                        ],),
                        SizedBox(height: 8),

                        Text(
                          "สถานะ: ${exchangemodels[index].status! == 'สำเร็จ'
                              ?('สำเร็จ')
                              :exchangemodels[index].status! == 'ยกเลิก'
                              ?('ยกเลิก')
                              :('รอการยืนยัน')}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: exchangemodels[index].status == "สำเร็จ"
                                ? kPrimaryColor : exchangemodels[index].status == "ยกเลิก"
                                ? Colors.red :Colors.orangeAccent,
                          ),
                        ),
                        SizedBox(height: 8),

                      ],
                    ),
                  ),
                ),
                Expanded(child: Column(children: [

                  Text('\$ ${exchangemodels[index].total!}'),

                   exchangemodels[index].status == "กำลังดำเนินการ"
                      ? ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50),
                         ),
                         elevation: 5,
                         // Foreground color
                         onPrimary: Colors.white,
                         // Background color
                         primary: kPrimaryColor,
                         minimumSize: Size(100, 40))
                         .copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
                     onPressed: () {
                       showModalBottomSheet(
                         context: context,backgroundColor: Colors.transparent,
                         builder: (BuildContext context) {
                           return Container(
                             height: 200.0,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10.0),
                                 topRight: Radius.circular(10.0),
                               ),
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   'คุณต้องการยกเลิกรายการนี้?',
                                   style: TextStyle(fontSize: 18),
                                 ),
                                 SizedBox(height: 20),
                                 ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(50),
                                       ),
                                       elevation: 5,
                                       // Foreground color
                                       onPrimary: Colors.white,
                                       // Background color
                                       primary: kPrimaryColor,
                                       minimumSize: Size(100, 40))
                                       .copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
                                   onPressed: () {
                                     Navigator.of(context).pop();
                                   },
                                   child: Text('ยกเลิก'),
                                 ),
                                 SizedBox(height: 10),
                                 ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(50),
                                       ),
                                       elevation: 5,
                                       // Foreground color
                                       onPrimary: Colors.white,
                                       // Background color
                                       primary: kPrimaryColor,
                                       minimumSize: Size(100, 40))
                                       .copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
                                   onPressed: () {
                                     // รายละเอียดการยกเลิก
                                     Navigator.of(context).pop();
                                   },
                                   child: Text('ตกลง'),
                                 ),
                               ],
                             ),
                           );
                         },
                       );
                     },
                     child: Text('ยกเลิก'),
                   )

                    : SizedBox.shrink(),],
                ))
              ],
            ),

          );
        },
    )

    );
  }
}

void showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("ยืนยันการยกเลิก"),
    content: Text("คุณต้องการยกเลิกรายการนี้หรือไม่?"),
    actions: [
      OutlinedButton(
        child: Text("ยกเลิก"),
        onPressed: () {
          // ปิด Dialog
          Navigator.of(context).pop();
        },
      ),
      OutlinedButton(
        child: Text("ตกลง"),
        onPressed: () {
          // ทำงานต่อไปตามต้องการ หรือแสดงข้อความว่ายกเลิกเรียบร้อยแล้ว
          Navigator.of(context).pop("ยกเลิกเรียบร้อยแล้ว");
        },
      ),
    ],
  );
}



