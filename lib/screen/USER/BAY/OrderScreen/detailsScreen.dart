import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/exchangemodel.dart';
import 'package:project/screen/USER/SALE/HomePageSell.dart';
import 'package:url_launcher/url_launcher.dart';

import 'receipt.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.exchangemodel})
      : super(key: key);
  final ExchangeModel exchangemodel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final ExchangeModel exchangemodel;
  late double buyerLatitude = 0; // Variable to store the buyer's latitude
  late double buyerLongitude = 0; // Variable to store the buyer's longitude
  late double saleLatitude;
  late double saleLongitude;
  var status = null;
  bool isButtonDisabled1 = false;
  bool isButtonDisabled2 = false;
  bool isButtonDisabled3 = false;
  bool isButtonDisabled4 = false;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    status = widget.exchangemodel.status;
    exchangemodel = widget.exchangemodel;
    saleLatitude = double.parse(exchangemodel.latitude!);
    saleLongitude = double.parse(exchangemodel.longitude!);
  }

  void updateListOrderStatus(int exchangeId) async {
    print(exchangeId);
    try {
      var response = await Dio().get(
        API.BASE_URL +
            '/kongkao/updatelistorderstatus.php?isAdd=true&status=สำเร็จ&exchangeid=$exchangeId',
      );
      print(response);

      setState(() {
        exchangemodel = ExchangeModel(); // กำหนดค่าใหม่ให้กับ exchangemodel
      });
    } catch (e) {
      print(e);
    }
  }

  void updateListOrderStatusconfirm(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=ยืนยัน&exchangeid=$exchangeId');
      print(response);

      setState(() {
        exchangemodel = ExchangeModel(); // กำหนดค่าใหม่ให้กับ exchangemodel
      });
    } catch (e) {
      print(e);
    }
  }

  void updateListOrderStatusgoing(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=กำลังเดินทาง&exchangeid=$exchangeId');
      print(response);

      setState(() {
        exchangemodel = ExchangeModel(); // กำหนดค่าใหม่ให้กับ exchangemodel
      });
    } catch (e) {
      print(e);
    }
  }

  void updateListOrderStatusdestination(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=ถึงที่หมาย&exchangeid=$exchangeId');

      setState(() {
        exchangemodel = ExchangeModel(); // กำหนดค่าใหม่ให้กับ exchangemodel
      });
    } catch (e) {
      print(e);
    }
  }

  void updateListOrderStatusfinish(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=เสร็จสิ้น&exchangeid=$exchangeId');
      print(response);

      setState(() {
        exchangemodel = ExchangeModel(); // กำหนดค่าใหม่ให้กับ exchangemodel
      });
    } catch (e) {
      print(e);
    }
  }

  void updateListOrderStatuscancel(int exchangeId) async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updatelistorderstatus.php?isAdd=true&status=ยกเลิก&exchangeid=$exchangeId');
      print(response);

      setState(() {
        exchangemodel = ExchangeModel();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        buyerLatitude = position.latitude;
        buyerLongitude = position.longitude;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 5,
                    // Foreground color
                    onPrimary: Colors.white,
                    // Background color
                    primary: Colors.red,
                    minimumSize: Size(1, 1))
                .copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
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
                              .copyWith(
                                  elevation: ButtonStyleButton.allOrNull(2.0)),
                          onPressed: () {
                            Navigator.of(context).pop();
                            updateListOrderStatuscancel(
                                int.parse(exchangemodel.exchangeid!));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePageSell()), // แทน HomeScreen ด้วยหน้าที่ต้องการกลับไปยังหน้าเริ่มต้น
                            );
                          },
                          child: Text('ตกลง'),
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
                                  primary: Colors.red,
                                  minimumSize: Size(100, 40))
                              .copyWith(
                                  elevation: ButtonStyleButton.allOrNull(2.0)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('ยกเลิก'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('ยกเลิก'),
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            )
          : Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey, // Set your desired color
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(12),
                          topEnd: Radius.circular(12),
                        ),
                      ),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            buyerLatitude!, // Replace with the actual buyer's latitude
                            buyerLongitude!, // Replace with the actual buyer's longitude
                          ),
                          zoom: 12.0,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId('buyer'),
                            position: LatLng(
                              buyerLatitude!, // Replace with the actual buyer's latitude
                              buyerLongitude!, // Replace with the actual buyer's longitude
                            ),
                            icon: BitmapDescriptor.defaultMarker,
                          ),
                          Marker(
                            markerId: MarkerId('seller'),
                            position: LatLng(
                              saleLatitude, // Use the converted value
                              saleLongitude, // Use the converted value
                            ),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueOrange),
                          ),
                        },
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white, // Set your desired color
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'รายการ #${exchangemodel.exchangeid}', // Customize your text
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                  minimumSize: Size(100, 40),
                                ).copyWith(
                                  elevation: ButtonStyleButton.allOrNull(2.0),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ReceiptPage(exchangemodel: exchangemodel,)),
                                  );
                                },
                                child: Text('ออกใบเสร็จ'),
                              ),

                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'รายละเอียด', // Customize your text
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(Icons.person,
                                  color: kPrimaryColor), // Customize your icon
                              SizedBox(width: 8),
                              Text(
                                'ชื่อ: ${exchangemodel.name}', // Customize your text
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'นามสกุล: ${exchangemodel.lastname}', // Customize your text
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.phone,
                                  color: kPrimaryColor), // Customize your icon
                              SizedBox(width: 8),
                              Text(
                                'เบอร์โทร: 0${exchangemodel.phone}', // Customize your text
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.email,
                                  color: kPrimaryColor), // Customize your icon
                              SizedBox(width: 8),
                              Text(
                                'อีเมล: ${exchangemodel.email}', // Customize your text
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.shopping_bag,
                                  color: kPrimaryColor), // Customize your icon
                              SizedBox(width: 8),
                              Text(
                                'รายละเอียด: ${exchangemodel.detail?.replaceAll('[', '').replaceAll(']', '')}', // Customize your text
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.home_filled,
                                  color: kPrimaryColor), // Customize your icon
                              SizedBox(width: 8),
                              Text(
                                'ที่อยู่: ${exchangemodel.housenum} ${exchangemodel.district} ${exchangemodel.prefecture} ${exchangemodel.city}', // Customize your text
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Column(
                              children: [
                                Text(
                                  'สถานะการสั่งซื้อ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.shop,
                                      color: isButtonDisabled1 == true ||
                                          isButtonDisabled2 ==true ||
                                          isButtonDisabled3 ==true
                                          ? Colors.green
                                          : null,
                                    ),
                                    Container(
                                      color: isButtonDisabled2 ==
                                          true ||
                                          isButtonDisabled3 ==
                                              true
                                          ? Colors.green
                                          : kPrimaryblckColor,
                                      height: 5,
                                      width: 50,
                                    ),
                                    Icon(
                                      Icons.car_crash,
                                      color: isButtonDisabled2 ==
                                          true ||
                                          isButtonDisabled4 ==
                                              true
                                          ? Colors.green
                                          : null,
                                    ),
                                    Container(
                                      color: isButtonDisabled4 ==
                                          true
                                          ? Colors.green
                                          : kPrimaryblckColor,
                                      height: 5,
                                      width: 50,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: isButtonDisabled4 ==
                                          true
                                          ? Colors.green
                                          : null,
                                    ),
                                  ],
                                ),


                                isButtonDisabled1 == false
                                ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 5,
                                    // Foreground color
                                    onPrimary: Colors.white,
                                    // Background color
                                    primary: isButtonDisabled1
                                        ? Colors.grey
                                        : kPrimaryColor,
                                    minimumSize: Size(100, 40),
                                  ).copyWith(
                                    elevation: ButtonStyleButton.allOrNull(2.0),
                                  ),
                                  onPressed: isButtonDisabled1
                                      ? null
                                      : () {
                                    setState(() {
                                      isButtonDisabled1 = true;
                                    });

                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                              Radius.circular(10.0),
                                              topRight:
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'คุณต้องการยืนยันรายการนี้?',
                                                style:
                                                TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(height: 20),
                                              ElevatedButton(
                                                style: ElevatedButton
                                                    .styleFrom(
                                                  shape:
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(50),
                                                  ),
                                                  elevation: 5,
                                                  // Foreground color
                                                  onPrimary: Colors.white,
                                                  // Background color
                                                  primary: kPrimaryColor,
                                                  minimumSize:
                                                  Size(100, 40),
                                                ).copyWith(
                                                  elevation:
                                                  ButtonStyleButton
                                                      .allOrNull(2.0),
                                                ),
                                                onPressed: () {
                                                  status = 'ยืนยัน';
                                                  print(status);
                                                  updateListOrderStatusconfirm(
                                                      int.parse(exchangemodel
                                                          .exchangeid!));
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                                child: Text('ยืนยัน'),
                                              ),
                                              SizedBox(height: 10),
                                              ElevatedButton(
                                                style: ElevatedButton
                                                    .styleFrom(
                                                  shape:
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(50),
                                                  ),
                                                  elevation: 5,
                                                  // Foreground color
                                                  onPrimary: Colors.white,
                                                  // Background color
                                                  primary: Colors.red,
                                                  minimumSize:
                                                  Size(100, 40),
                                                ).copyWith(
                                                  elevation:
                                                  ButtonStyleButton
                                                      .allOrNull(2.0),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                                child: Text('ยกเลิก'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text('ยืนยันรายการ'),
                                )
                                    :isButtonDisabled2==false
                                ?ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 5,
                                    // Foreground color
                                    onPrimary: Colors.white,
                                    // Background color
                                    primary: isButtonDisabled2 ? Colors.grey : kPrimaryColor,
                                    minimumSize: Size(100, 40),
                                  ).copyWith(
                                    elevation: ButtonStyleButton.allOrNull(2.0),
                                  ),
                                  onPressed: isButtonDisabled2
                                      ? null
                                      : () {
                                    setState(() {
                                      isButtonDisabled2 = true;
                                    });

                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
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
                                                'คุณต้องการยืนยันรายการนี้?',
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
                                                  minimumSize: Size(100, 40),
                                                ).copyWith(
                                                  elevation: ButtonStyleButton.allOrNull(2.0),
                                                ),
                                                onPressed: () {
                                                  status = 'กำลังเดินทาง';
                                                  updateListOrderStatusgoing(int.parse(exchangemodel.exchangeid!));
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ยืนยัน'),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  elevation: 5,
                                                  // Foreground color
                                                  onPrimary: Colors.white,
                                                  // Background color
                                                  primary: Colors.red,
                                                  minimumSize: Size(100, 40),
                                                ).copyWith(
                                                  elevation: ButtonStyleButton.allOrNull(2.0),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ยกเลิก'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text('กำลังเดินทาง'),
                                )
                                    :isButtonDisabled4==false
                                ?ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 5,
                                    // Foreground color
                                    onPrimary: Colors.white,
                                    // Background color
                                    primary: isButtonDisabled4 ? Colors.grey : kPrimaryColor,
                                    minimumSize: Size(100, 40),
                                  ).copyWith(
                                    elevation: ButtonStyleButton.allOrNull(2.0),
                                  ),
                                  onPressed: isButtonDisabled4
                                      ? null
                                      : () {
                                    setState(() {
                                      isButtonDisabled4 = true;
                                    });

                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
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
                                                'คุณต้องการยืนยันรายการนี้?',
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
                                                  minimumSize: Size(100, 40),
                                                ).copyWith(
                                                  elevation: ButtonStyleButton.allOrNull(2.0),
                                                ),
                                                onPressed: () {
                                                  status = 'ถึงที่หมาย';
                                                  updateListOrderStatusdestination(int.parse(exchangemodel.exchangeid!));
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ยืนยัน'),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  elevation: 5,
                                                  // Foreground color
                                                  onPrimary: Colors.white,
                                                  // Background color
                                                  primary: Colors.red,
                                                  minimumSize: Size(100, 40),
                                                ).copyWith(
                                                  elevation: ButtonStyleButton.allOrNull(2.0),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ยกเลิก'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text('ถึงที่หมาย'),
                                )
                              :Text(''),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     ElevatedButton(
                                //       style: ElevatedButton.styleFrom(
                                //         shape: RoundedRectangleBorder(
                                //           borderRadius: BorderRadius.circular(50),
                                //         ),
                                //         elevation: 5,
                                //         // Foreground color
                                //         onPrimary: Colors.white,
                                //         // Background color
                                //         primary: isButtonDisabled1
                                //             ? Colors.grey
                                //             : kPrimaryColor,
                                //         minimumSize: Size(100, 40),
                                //       ).copyWith(
                                //         elevation: ButtonStyleButton.allOrNull(2.0),
                                //       ),
                                //       onPressed: isButtonDisabled1
                                //           ? null
                                //           : () {
                                //         setState(() {
                                //           isButtonDisabled1 = true;
                                //         });
                                //
                                //         showModalBottomSheet(
                                //           context: context,
                                //           backgroundColor: Colors.transparent,
                                //           builder: (BuildContext context) {
                                //             return Container(
                                //               height: 200.0,
                                //               decoration: BoxDecoration(
                                //                 color: Colors.white,
                                //                 borderRadius: BorderRadius.only(
                                //                   topLeft:
                                //                   Radius.circular(10.0),
                                //                   topRight:
                                //                   Radius.circular(10.0),
                                //                 ),
                                //               ),
                                //               child: Column(
                                //                 mainAxisAlignment:
                                //                 MainAxisAlignment.center,
                                //                 children: [
                                //                   Text(
                                //                     'คุณต้องการยืนยันรายการนี้?',
                                //                     style:
                                //                     TextStyle(fontSize: 18),
                                //                   ),
                                //                   SizedBox(height: 20),
                                //                   ElevatedButton(
                                //                     style: ElevatedButton
                                //                         .styleFrom(
                                //                       shape:
                                //                       RoundedRectangleBorder(
                                //                         borderRadius:
                                //                         BorderRadius
                                //                             .circular(50),
                                //                       ),
                                //                       elevation: 5,
                                //                       // Foreground color
                                //                       onPrimary: Colors.white,
                                //                       // Background color
                                //                       primary: kPrimaryColor,
                                //                       minimumSize:
                                //                       Size(100, 40),
                                //                     ).copyWith(
                                //                       elevation:
                                //                       ButtonStyleButton
                                //                           .allOrNull(2.0),
                                //                     ),
                                //                     onPressed: () {
                                //                       status = 'ยืนยัน';
                                //                       print(status);
                                //                       updateListOrderStatusconfirm(
                                //                           int.parse(exchangemodel
                                //                               .exchangeid!));
                                //                       Navigator.of(context)
                                //                           .pop();
                                //                     },
                                //                     child: Text('ยืนยัน'),
                                //                   ),
                                //                   SizedBox(height: 10),
                                //                   ElevatedButton(
                                //                     style: ElevatedButton
                                //                         .styleFrom(
                                //                       shape:
                                //                       RoundedRectangleBorder(
                                //                         borderRadius:
                                //                         BorderRadius
                                //                             .circular(50),
                                //                       ),
                                //                       elevation: 5,
                                //                       // Foreground color
                                //                       onPrimary: Colors.white,
                                //                       // Background color
                                //                       primary: Colors.red,
                                //                       minimumSize:
                                //                       Size(100, 40),
                                //                     ).copyWith(
                                //                       elevation:
                                //                       ButtonStyleButton
                                //                           .allOrNull(2.0),
                                //                     ),
                                //                     onPressed: () {
                                //                       Navigator.of(context)
                                //                           .pop();
                                //                     },
                                //                     child: Text('ยกเลิก'),
                                //                   ),
                                //                 ],
                                //               ),
                                //             );
                                //           },
                                //         );
                                //       },
                                //       child: Text('ยืนยันรายการ'),
                                //     ),
                                //     ElevatedButton(
                                //       style: ElevatedButton.styleFrom(
                                //         shape: RoundedRectangleBorder(
                                //           borderRadius: BorderRadius.circular(50),
                                //         ),
                                //         elevation: 5,
                                //         // Foreground color
                                //         onPrimary: Colors.white,
                                //         // Background color
                                //         primary: isButtonDisabled2 ? Colors.grey : kPrimaryColor,
                                //         minimumSize: Size(100, 40),
                                //       ).copyWith(
                                //         elevation: ButtonStyleButton.allOrNull(2.0),
                                //       ),
                                //       onPressed: isButtonDisabled2
                                //           ? null
                                //           : () {
                                //         setState(() {
                                //           isButtonDisabled2 = true;
                                //         });
                                //
                                //         showModalBottomSheet(
                                //           context: context,
                                //           backgroundColor: Colors.transparent,
                                //           builder: (BuildContext context) {
                                //             return Container(
                                //               height: 200.0,
                                //               decoration: BoxDecoration(
                                //                 color: Colors.white,
                                //                 borderRadius: BorderRadius.only(
                                //                   topLeft: Radius.circular(10.0),
                                //                   topRight: Radius.circular(10.0),
                                //                 ),
                                //               ),
                                //               child: Column(
                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                //                 children: [
                                //                   Text(
                                //                     'คุณต้องการยืนยันรายการนี้?',
                                //                     style: TextStyle(fontSize: 18),
                                //                   ),
                                //                   SizedBox(height: 20),
                                //                   ElevatedButton(
                                //                     style: ElevatedButton.styleFrom(
                                //                       shape: RoundedRectangleBorder(
                                //                         borderRadius: BorderRadius.circular(50),
                                //                       ),
                                //                       elevation: 5,
                                //                       // Foreground color
                                //                       onPrimary: Colors.white,
                                //                       // Background color
                                //                       primary: kPrimaryColor,
                                //                       minimumSize: Size(100, 40),
                                //                     ).copyWith(
                                //                       elevation: ButtonStyleButton.allOrNull(2.0),
                                //                     ),
                                //                     onPressed: () {
                                //                       status = 'กำลังเดินทาง';
                                //                       updateListOrderStatusgoing(int.parse(exchangemodel.exchangeid!));
                                //                       Navigator.of(context).pop();
                                //                     },
                                //                     child: Text('ยืนยัน'),
                                //                   ),
                                //                   ElevatedButton(
                                //                     style: ElevatedButton.styleFrom(
                                //                       shape: RoundedRectangleBorder(
                                //                         borderRadius: BorderRadius.circular(50),
                                //                       ),
                                //                       elevation: 5,
                                //                       // Foreground color
                                //                       onPrimary: Colors.white,
                                //                       // Background color
                                //                       primary: Colors.red,
                                //                       minimumSize: Size(100, 40),
                                //                     ).copyWith(
                                //                       elevation: ButtonStyleButton.allOrNull(2.0),
                                //                     ),
                                //                     onPressed: () {
                                //                       Navigator.of(context).pop();
                                //                     },
                                //                     child: Text('ยกเลิก'),
                                //                   ),
                                //                 ],
                                //               ),
                                //             );
                                //           },
                                //         );
                                //       },
                                //       child: Text('กำลังเดินทาง'),
                                //     )
                                //
                                //   ],
                                // ),
                                // ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(50),
                                //     ),
                                //     elevation: 5,
                                //     // Foreground color
                                //     onPrimary: Colors.white,
                                //     // Background color
                                //     primary: isButtonDisabled4 ? Colors.grey : kPrimaryColor,
                                //     minimumSize: Size(100, 40),
                                //   ).copyWith(
                                //     elevation: ButtonStyleButton.allOrNull(2.0),
                                //   ),
                                //   onPressed: isButtonDisabled4
                                //       ? null
                                //       : () {
                                //     setState(() {
                                //       isButtonDisabled4 = true;
                                //     });
                                //
                                //     showModalBottomSheet(
                                //       context: context,
                                //       backgroundColor: Colors.transparent,
                                //       builder: (BuildContext context) {
                                //         return Container(
                                //           height: 200.0,
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //             borderRadius: BorderRadius.only(
                                //               topLeft: Radius.circular(10.0),
                                //               topRight: Radius.circular(10.0),
                                //             ),
                                //           ),
                                //           child: Column(
                                //             mainAxisAlignment: MainAxisAlignment.center,
                                //             children: [
                                //               Text(
                                //                 'คุณต้องการยืนยันรายการนี้?',
                                //                 style: TextStyle(fontSize: 18),
                                //               ),
                                //               SizedBox(height: 20),
                                //               ElevatedButton(
                                //                 style: ElevatedButton.styleFrom(
                                //                   shape: RoundedRectangleBorder(
                                //                     borderRadius: BorderRadius.circular(50),
                                //                   ),
                                //                   elevation: 5,
                                //                   // Foreground color
                                //                   onPrimary: Colors.white,
                                //                   // Background color
                                //                   primary: kPrimaryColor,
                                //                   minimumSize: Size(100, 40),
                                //                 ).copyWith(
                                //                   elevation: ButtonStyleButton.allOrNull(2.0),
                                //                 ),
                                //                 onPressed: () {
                                //                   status = 'ถึงที่หมาย';
                                //                   updateListOrderStatusdestination(int.parse(exchangemodel.exchangeid!));
                                //                   Navigator.of(context).pop();
                                //                 },
                                //                 child: Text('ยืนยัน'),
                                //               ),
                                //               ElevatedButton(
                                //                 style: ElevatedButton.styleFrom(
                                //                   shape: RoundedRectangleBorder(
                                //                     borderRadius: BorderRadius.circular(50),
                                //                   ),
                                //                   elevation: 5,
                                //                   // Foreground color
                                //                   onPrimary: Colors.white,
                                //                   // Background color
                                //                   primary: Colors.red,
                                //                   minimumSize: Size(100, 40),
                                //                 ).copyWith(
                                //                   elevation: ButtonStyleButton.allOrNull(2.0),
                                //                 ),
                                //                 onPressed: () {
                                //                   Navigator.of(context).pop();
                                //                 },
                                //                 child: Text('ยกเลิก'),
                                //               ),
                                //             ],
                                //           ),
                                //         );
                                //       },
                                //     );
                                //   },
                                //   child: Text('ถึงที่หมาย'),
                                // ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double buyerLat =
              buyerLatitude; // Replace with the actual buyer's latitude
          double buyerLng =
              buyerLongitude; // Replace with the actual buyer's longitude
          double sellerLat =
              saleLatitude; // Replace with the actual seller's latitude
          double sellerLng =
              saleLongitude; // Replace with the actual seller's longitude
          // Open a navigation app (e.g., Google Maps) with the buyer and seller coordinates
          String url =
              'https://www.google.com/maps/dir/?api=1&origin=$buyerLat,$buyerLng&destination=$sellerLat,$sellerLng';
          launch(url);
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
