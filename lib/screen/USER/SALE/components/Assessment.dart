import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/exchangemodel.dart';
import 'package:http/http.dart' as http;
import 'package:project/screen/USER/SALE/HomePageSell.dart';

class Assessment extends StatefulWidget {
  const Assessment({Key? key, required this.exchangemodel}) : super(key: key);
  final ExchangeModel exchangemodel;

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  late final ExchangeModel exchangemodel;
  double rating = 0;
  String comment ='';
  TextEditingController commentController = TextEditingController();
    int exchangeId = 0;  // ประกาศตัวแปร exchangeId ที่มีชนิดเป็น int

  @override
  void initState() {
    super.initState();
    exchangemodel = widget.exchangemodel;

  }

  Future<bool> submitReview() async {
    print(exchangeId);
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/insertreviews.php?isAdd=true&exchangeId=${exchangemodel.exchangeid}&rating=$rating&review_text=$comment&customer_name=$userid&shop=${exchangemodel.iduserbuy}'
      );

      print(response);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }


  Widget buildRatingStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.star,
            color: rating >= 1 ? kPrimaryColor : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              rating = 1;
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.star,
            color: rating >= 2 ? kPrimaryColor : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              rating = 2;
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.star,
            color: rating >= 3 ? kPrimaryColor : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              rating = 3;
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.star,
            color: rating >= 4 ? kPrimaryColor : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              rating = 4;
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.star,
            color: rating >= 5 ? kPrimaryColor : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              rating = 5;
            });
          },
        ),
      ],
    );
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(API.BASE_URL+exchangemodel.photo!),
              ),
              SizedBox(height: 16),
              Text(
                exchangemodel.shop ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                exchangemodel.detail ?? '',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'ให้ดาวร้าน:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              buildRatingStars(),
              SizedBox(height: 16),
              // TextField(
              //   onChanged: (value) {
              //     setState(() {
              //       comment = value;
              //     });
              //   },
              //   maxLines: 3,
              //   decoration: InputDecoration(
              //     hintText: 'เเสดงความคิดเห็น',
              //     border: OutlineInputBorder(),
              //   ),
              // ),

              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  bool success = await submitReview();
                  if (success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>HomePageSell()),
                    );
                  } else {
                    // ดำเนินการหลังบันทึกข้อมูลไม่สำเร็จ
                  }
                },
                child: Text('ยืนยัน'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
