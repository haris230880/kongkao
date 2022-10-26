import 'dart:math';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/screen/Regis/components/bobyaddress/boby_register_address_bay.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/my_style.dart';
import '../../../../configs/services/datauserbay.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../background_regis.dart';
import 'package:dio/dio.dart';

import '../bodyregister/body_register_bay.dart';

class BodyRegisNumberBay extends StatefulWidget {
  const BodyRegisNumberBay({Key? key}) : super(key: key);

  @override
  State<BodyRegisNumberBay> createState() => _BodyRegisNumberBayState();
}

class _BodyRegisNumberBayState extends State<BodyRegisNumberBay> {
  final formKey = GlobalKey<FormState>();
  bool isHidden = false; //กำหนดซ่อนรหัส

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Kongkao",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              MyStyle().CircleAvataruserbuy(),
              Container(
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 20),
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
                  children: <Widget>[
                    Text(
                      "ลงทะเบียน ผู้ซื้อ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 70,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.length < 10) {
                            return "กรอก เบอร์โทรศัพท์";
                          }
                          return null;
                        },
                        onChanged: (value) => buyuser_phone = value.trim(),
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        cursorColor: kPrimaryColor,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: kPrimaryLightColor),
                          ), //เปลียนสีเส้นขอบเมื่อกด
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'เบอร์โทรศัพท์ ',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.length < 6) {
                            return "enter รหัสผ่าน 6 ตัวขึ้นไป";
                          }
                          return null;
                        },
                        onChanged: (value) => buyuser_password = value.trim(),
                        obscureText: isHidden,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: kPrimaryLightColor),
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'รหัสผ่าน ',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: kPrimaryColor,
                          ),
                          suffix: InkWell(
                            onTap: togglePasswordVisibility,
                            child: IconButton(
                              icon: isHidden
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: kPrimaryColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: kPrimaryColor,
                                    ),
                              onPressed: togglePasswordVisibility,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                  if (isValidFrom) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OtpScreenBuy();
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
                        return RegisterAddressBay();
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
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);




} //end
