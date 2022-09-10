import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../configs/datauserbay.dart';
import '../../../../constants.dart';
import '../background_regis.dart';
import '../regis.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BobyRegisterAddressBay extends StatefulWidget {
  const BobyRegisterAddressBay({Key? key}) : super(key: key);

  @override
  State<BobyRegisterAddressBay> createState() => _BobyRegisterAddressBayState();
}

class _BobyRegisterAddressBayState extends State<BobyRegisterAddressBay> {

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/icons/userbay.png',
                scale: 5,
              ),
              Container(
                margin: EdgeInsets.all(30),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: kPrimaryColor,
                          offset: Offset(1, 1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ลงทะเบียนผู้ซื้อ',
                      style: TextStyleblodgreen,
                    ),
                    Text(
                      'ที่อยู่',
                      style: TextStyle(
                          color: kPrimaryblckColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "กรอก ชื่อร้าน";
                        }
                        return null;
                      },
                        onChanged: (value) => buyuser_shop = value.trim(),
                        keyboardType: TextInputType.text,
                        cursorColor: kPrimaryColor,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'ชื่อร้าน',
                            style: TextStyle(color: kPrimaryblckColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก เวลาทำการ";
                              }
                              return null;
                            },
                            onChanged: (value) => buyuser_time = value.trim(),
                            keyboardType: TextInputType.datetime,
                            cursorColor: kPrimaryColor,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              label: Text(
                                'เวลาทำการ',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก ค่าบริการ";
                              }
                              return null;
                            },
                            onChanged: (value) => buyuser_charge = value.trim(),
                            keyboardType: TextInputType.number,
                            cursorColor: kPrimaryColor,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              label: Text(
                                'ค่าบริการ',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "กรอก บ้านเลขที่";
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            buyuser_housenum = value.trim(),
                        keyboardType: TextInputType.streetAddress,
                        cursorColor: kPrimaryColor,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'บ้านเลขที่',
                            style: TextStyle(color: kPrimaryblckColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก ตำบล";
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                buyuser_district = value.trim(),
                            keyboardType: TextInputType.text,
                            cursorColor: kPrimaryColor,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              label: Text(
                                'ตำบล',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก อำเภอ";
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                buyuser_prefecture = value.trim(),
                            keyboardType: TextInputType.text,
                            cursorColor: kPrimaryColor,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              label: Text(
                                'อำเภอ',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก จังหวัด";
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                buyuser_city = value.trim(),
                            keyboardType: TextInputType.text,
                            cursorColor: kPrimaryColor,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              label: Text(
                                'จังหวัด',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 140,

                          child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                              ],
                            validator: (value) {
                              if (value != null  && value.length<5 ) {
                                return "กรอก รหัสไปรษณีย์";
                              }
                              return null;
                            },
                            onChanged: (value) => buyuser_postid = value.trim(),
                            keyboardType: TextInputType.number,
                            cursorColor: kPrimaryColor,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(20),),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              label: Text(
                                ' รหัสไปรษณีย์ ',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: 400,
                      child:
                      GoogleMap(
                        markers: {
                          Marker(
                              markerId: MarkerId("1"),
                              position: LatLng(13.6900043, 100.7479237),
                              infoWindow: InfoWindow(title: "สนามบินสุวรรณภูมิ", snippet: "สนามบินนานาชาติของประเทศไทย"),),
                        },
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(13.6900043, 100.7479237),
                          zoom: 15,
                        ),

                      ),
                    ),
                    // GoogleMap(initialCameraPosition: ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                              // Foreground color
                              onPrimary: Colors.white,
                              // Background color
                              primary: kPrimaryColor,
                              minimumSize: Size(100, 50))
                          .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
                      onPressed: () {
                        final isValidFrom = formKey.currentState!.validate();
                        if(isValidFrom){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisScreenBayNumber();
                              },
                            ),
                          );
                        }

                      },
                      child: const Text('ถัดไป'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterBay();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'ยกเลิก',
                        style: TextStyle(color: kPrimaryblckColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Future<LocationData?> getCurrentLocation() async {
  //   Location location = Location();
  //   try {
  //     return await location.getLocation();
  //   } on PlatformException catch (e) {
  //     if (e.code == 'PERMISSION_DENIED') {
  //       // Permission denied
  //     }
  //     return null;
  //   }
  // }
}
