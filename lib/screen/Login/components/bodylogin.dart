



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/screen/Login/components/backgroundlogin.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/SALE/HomePageSell.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
String? phoneuser;
String? passworduser;

class BodyLogin extends StatefulWidget {
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  Future<void> checkAuthen() async {
    try {
      var response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        // Internet connection is available
        String url = API.BASE_URL + '/kongkao/insertuserphone.php?isAdd=true&phone=$phoneuser';
        Response response = await Dio().get(url);
        print('response: $response');
        var result = jsonDecode(response.data);
        print('result: $result');

        if (result == null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('ไม่ได้ลงทะเบียน'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('ตกลง'),
                ),
              ],
            ),
          );
        } else {
          for (var map in result) {
            UserModel userModel = UserModel.fromJson(map);
            if (passworduser == userModel.password) {
              print('password: $passworduser');
              String? chosenType = userModel.typeuser;
              print(chosenType);
              if (chosenType == 'sale') {
                print('Sale: $passworduser');
                routetoservice(HomePageSell(), userModel);
              } else if (chosenType == 'buy') {
                print('Buy: $passworduser');
                routetoservice(HomePageBay(), userModel);
              }
              return;
            }
          }

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('หมายเลขโทรศัพท์หรือรหัสผ่านไม่ถูกต้อง'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('ตกลง'),
                ),
              ],
            ),
          );
        }
      } else {
        // No internet connection
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('ไม่มีการเชื่อมต่ออินเทอร์เน็ต'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('เกิดข้อผิดพลาด'),
          content: Text('เกิดข้อผิดพลาดในการเชื่อมต่อกับเซิร์ฟเวอร์'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('ตกลง'),
            ),
          ],
        ),
      );
    }
  }
 Future<void> routetoservice(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('_id', userModel.id ?? '');
    preferences.setString('_phone', userModel.phone ?? '');
    preferences.setString('_name', userModel.name ?? '');
    preferences.setString('_lastname', userModel.lastname ?? '');
    preferences.setString('_typeuser', userModel.typeuser ?? '');
    preferences.setString('_email', userModel.email ?? '');
    preferences.setString('_photo', userModel.photo ?? '');
    preferences.setString('_housenum', userModel.housenum ?? '');
    preferences.setString('_district', userModel.district ?? '');
    preferences.setString('_prefecture', userModel.prefecture ?? '');
    preferences.setString('_city', userModel.city ?? '');
    preferences.setString('_postid', userModel.postid ?? '');
    preferences.setString('_latitude', userModel.latitude ?? '');
    preferences.setString('_longitude', userModel.longitude ?? '');
    preferences.setString('_charge', userModel.charge ?? '');
    preferences.setString('_shop', userModel.shop ?? '');
    preferences.setString('_time', userModel.time ?? '');
    preferences.setString('_password', userModel.password ?? '');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => myWidget),
          (route) => false,
    );
  }

  final formKey = GlobalKey<FormState>();
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
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
              Image.asset(
                "assets/images/logo.jpg",
                height: size.height * 0.2,
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor), // Set border color
                  borderRadius: BorderRadius.all(Radius.circular(20.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: kPrimaryColor,
                      offset: Offset(1, 1),
                    ),
                  ], // Add shadow
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "เข้าสู่ระบบ",
                      style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold, color:kPrimaryColor),
                    ),
                     SizedBox(height: 20),
                    Container(
                      height: 70,
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.length != 10) {
                            return 'กรุณากรอกหมายเลขโทรศัพท์ 10 หลัก';
                          }
                          return null;
                        },
                        onChanged: (value) => phoneuser = value.trim(),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.phone,
                        cursorColor: kPrimaryColor,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: 'หมายเลขโทรศัพท์',
                          labelStyle: TextStyle(color: kPrimaryblckColor, fontSize: 14),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            size: 20,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'กรุณากรอกรหัสผ่าน';
                          }
                          return null;
                        },
                        onChanged: (value) => passworduser = value.trim(),
                        obscureText: isHidden,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: kPrimaryColor,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          labelText: 'รหัสผ่าน',
                          labelStyle: TextStyle(color: kPrimaryblckColor, fontSize: 14),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 20,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: InkWell(
                            onTap: togglePasswordVisibility,
                            child: Icon(
                              isHidden ? Icons.visibility_off : Icons.visibility,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              loginButton(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
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

  ElevatedButton loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        // Foreground color
        onPrimary: Colors.white,
        // Background color
        primary: kPrimaryColor,
        minimumSize: Size(120, 50),
      ).copyWith(elevation: MaterialStateProperty.all(5.0)),
      onPressed: () {
        final isValidForm = formKey.currentState!.validate();
        if (isValidForm) {
          checkAuthen();
        }
      },
      child: const Text(
        'เข้าสู่ระบบ',
        style: TextStyle(fontSize: 14),
      ),
    );
  }


  void togglePasswordVisibility() =>
      setState(() => isHidden = !isHidden); //ซ้อนpassword
}
