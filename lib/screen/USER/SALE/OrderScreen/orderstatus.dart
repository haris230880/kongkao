import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/model/exchangemodel.dart';

class OrderStatusPage extends StatefulWidget {
  final ExchangeModel exchangeModel;

  const OrderStatusPage({Key? key, required this.exchangeModel})
      : super(key: key);

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('สถานะการสั่งซื้อ'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: kPrimaryblckColor,
            alignment: Alignment.center,
            height: 200,
            child: Image.asset('assets/icons/usersale.png'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'รายการสั่งซื้อ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage:
                  NetworkImage(API.BASE_URL + widget.exchangeModel.photo!),
            ),
            title: Text(widget.exchangeModel.shop!),
            subtitle: Text('ไปยัง: ${widget.exchangeModel.district!}'),
            trailing: Text(
              'เบอร์โทรศัพท์: ${widget.exchangeModel.phone} ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'สถานะการสั่งซื้อ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.shop,
                      color: widget.exchangeModel.status == 'ยืนยัน' ||
                              widget.exchangeModel.status == 'กำลังไป' ||
                              widget.exchangeModel.status == 'ถึงที่หมาย' ||
                              widget.exchangeModel.status == 'เสร็จสิ้น'
                          ? Colors.green
                          : null,
                    ),
                    Container(
                      color: widget.exchangeModel.status == 'กำลังไป' ||
                              widget.exchangeModel.status == 'ถึงที่หมาย' ||
                              widget.exchangeModel.status == 'เสร็จสิ้น'
                          ? Colors.green
                          : kPrimaryblckColor,
                      height: 5,
                      width: 50,
                    ),
                    Icon(
                      Icons.car_crash,
                      color: widget.exchangeModel.status == 'กำลังไป' ||
                              widget.exchangeModel.status == 'ถึงที่หมาย' ||
                              widget.exchangeModel.status == 'เสร็จสิ้น'
                          ? Colors.green
                          : null,
                    ),
                    Container(
                      color: widget.exchangeModel.status == 'ถึงที่หมาย' ||
                              widget.exchangeModel.status == 'เสร็จสิ้น'
                          ? Colors.green
                          : kPrimaryblckColor,
                      height: 5,
                      width: 50,
                    ),
                    Icon(
                      Icons.location_on,
                      color: widget.exchangeModel.status == 'ถึงที่หมาย' ||
                              widget.exchangeModel.status == 'เสร็จสิ้น'
                          ? Colors.green
                          : null,
                    ),
                    Container(
                      color: widget.exchangeModel.status == 'เสร็จสิ้น'
                          ? Colors.green
                          : kPrimaryblckColor,
                      height: 5,
                      width: 50,
                    ),
                    Icon(
                      Icons.offline_pin_rounded,
                      color: widget.exchangeModel.status == 'เสร็จสิ้น'
                          ? Colors.green
                          : null,
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Divider(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'รายละเอียด',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('รวม'),
                  Text('${widget.exchangeModel.total!} บาท')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ค่าบริการ'),
                  Text('${widget.exchangeModel.charge!} บาท')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ค่าส่ง'),
                  Text('${widget.exchangeModel.transport!} บาท')
                ],
              ),
            ]),
          ),

        ],
      ),
    );
  }
}
