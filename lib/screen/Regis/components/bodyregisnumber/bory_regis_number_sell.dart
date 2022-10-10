import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/future_All.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/bodyregisnumber/body_regis_number_bay.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_sell.dart';
import 'package:project/screen/Regis/components/regis.dart';
import '../../../../configs/datausersale.dart';
import '../../../../constants.dart';
import 'package:dio/dio.dart';

class BodyRegisNumberSale extends StatefulWidget {
  const BodyRegisNumberSale({Key? key}) : super(key: key);

  @override
  State<BodyRegisNumberSale> createState() => _BodyRegisNumberSaleState();
}

class _BodyRegisNumberSaleState extends State<BodyRegisNumberSale> {
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
              Text(
                "Kongkao",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
             MyStyle().CircleAvatarusersale(),
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
                        validator: (value) {
                          if (value != null && value.length < 10) {
                            return "enter เบอร์โทรศัพท์";
                          }
                          return null;
                        },
                        onChanged: (value) => selluser_phone = value.trim(),
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
                    SizedBox(height: 10,),
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
                        onChanged: (value) => selluser_password = value.trim(),

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
                  uplodeimageusersaveusersale();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OtpScreen();
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

  void uplodeimageusersaveusersale() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameimage = 'user$i.jpg';
    String url = API.BASE_URL + '/kongkao/saveimage.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] = await MultipartFile.fromFile(fileusersell!.path, filename: nameimage);
      FormData formData = FormData.fromMap(map);
      await Dio().post(url, data: formData).then((value) {
        print('value=====$value');
        selluser_photo = '/kongkao/Image/$nameimage';
        print('nameimage ======= $selluser_photo');
        print('user_photo>>>>>$selluser_photo');
        getHttpSaleuser();



      });
    } catch (e) {}
  }//บันทึกข้อมูลผู้ขายเเละรูป
  void getHttpSaleuser() async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/insertuser.php?id=3&name=$selluser_name&lastname=$selluser_sname&phone=$selluser_phone&email=$selluser_email&photo=$selluser_photo&typeuser=sale&password=$selluser_password&housenum=$selluser_housenum&district=$selluser_district&prefecture=$selluser_prefecture&city=$selluser_city&postid=$selluser_postid&latitude=$lat&longitude=$lng&charge=NULL&shop=NULL&time=NULL');
      print(response);
    } catch (e) {
      print(e);
    }
  }//apiบันทึกข้อมูลผู้ขาย
}//end


