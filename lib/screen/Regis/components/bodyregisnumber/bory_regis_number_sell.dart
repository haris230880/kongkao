import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/configs/services/datauserbay.dart';
import 'package:project/future_All.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/bodyregisnumber/body_regis_number_bay.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_sell.dart';
import 'package:project/screen/Regis/components/regis.dart';
import '../../../../configs/services/datausersale.dart';
import '../../../../constants.dart';
import 'package:dio/dio.dart';

class BodyRegisNumberSale extends StatefulWidget {
  const BodyRegisNumberSale({Key? key}) : super(key: key);

  @override
  State<BodyRegisNumberSale> createState() => _BodyRegisNumberSaleState();
}

class _BodyRegisNumberSaleState extends State<BodyRegisNumberSale> {

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print('fileusersell   $fileusersell');
  }


  bool isHidden = false;//กำหนดซ่อนรหัส
  final formKey = GlobalKey<FormState>();
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
              SizedBox(
                height: 20,
              ),
             MyStyle().CircleAvatarusersale(),
              Container(
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.all(20),
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
                      "ลงทะเบียน ผู้ขาย",
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
                        validator: (seuser_email) => EmailValidator.validate(selluser_email!)
                            ? null
                            : "กรอกอีเมล ลงท้ายด้วย@gmail.com",
                        onChanged: (value) => selluser_email = value.trim(),
                        cursorColor: kPrimaryColor,
                        keyboardType: TextInputType.emailAddress,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            contentPadding: EdgeInsets.all(10),
                            label: Text(
                              'อีเมล',
                              style: TextStyle(color: kPrimaryblckColor),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              size: 25,
                              color: kPrimaryColor,
                            )),
                      ),

                    ),
                    Container(
                      height: 70,
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.length < 6) {
                            return "enter รหัสผ่าน 6 ตัวขึ้นไป";}
                          return null;
                        },
                        onChanged: (value) => selluser_password = value.trim(),
                        obscureText: isHidden,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
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
                          suffixIcon: InkWell(
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
                  // uplodeimageusersaveusersale();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OtpScreenSale();
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
                        return RegisterAddressSell();
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


}//end


