



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



class BodyLogin extends StatefulWidget {
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {

  String? phoneuser;
  String? password;
  //--------------------//
  Future<Null> checkAuthen() async {
    String url =
        API.BASE_URL + '/kongkao/insertuserphone.php?isAdd=true&phone=$phoneuser';
    try {
      Response response = await Dio().get(url);
      print('resss>>>>>>>>> = $response');


      var result = jsonDecode(response.data);
      print('resl>>>>>> = $result');
      if (result == null) {
        normaDiolog(context, 'ไม่ได้ลงทะเบียน');
      }
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        print('$password');

        if (password == userModel.password) {
          String choseType = userModel.typeuser;
          if (choseType =='sale') {
            print('saleeeee$password');
            routetoservice(HomePageSell(),userModel);
          } else if (choseType =='buy') {
            print('buyyyyyyy$password');
            routetoservice(HomePageBay(),userModel);
          }
        } else {
          normaDiolog(context, 'หมายเลขโทรศัพท หรือ รหัสผ่าน ไม่ถูกต้อง');
        }
      }
    } catch (e) {}
  } //ตรวจสอบphoneการเข้าสู่ระบบ

  Future<Null> routetoservice(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('_id', userModel.id);
    preferences.setString('_phone', userModel.phone);
    preferences.setString('_name', userModel.name);
    preferences.setString('_lastname', userModel.lastname);
    preferences.setString('_typeuser', userModel.typeuser);
    preferences.setString('_email', userModel.email);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
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
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kPrimaryColor // Set border color
                        ), // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)), // Set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: kPrimaryColor,
                          offset: Offset(1, 1))
                    ] // Make rounded corner of border
                    ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "เข้าสู่ระบบ ",
                      style: TextStyleblodgreen,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.length < 10) {
                            return "กรอก หมายเลขโทรศัพท 10 ตัว";
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            contentPadding: EdgeInsets.all(10),
                            label: Text(
                              'หมายเลขโทรศัพท ์',
                              style: TextStyle(
                                  color: kPrimaryblckColor, fontSize: 14),
                            ),
                            prefixIcon: const Icon(
                              Icons.phone_android,
                              size: 20,
                              color: kPrimaryColor,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "กรอก รหัสผ่าน";
                          }
                          return null;
                        },
                        onChanged: (value) => password = value.trim(),
                        obscureText: isHidden,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: kPrimaryColor,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            contentPadding: EdgeInsets.all(10),
                            label: Text(
                              'รหัสผ่าน',
                              style: TextStyle(
                                  color: kPrimaryblckColor, fontSize: 14),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 20,
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
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              LoginButton(),
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

  ElevatedButton LoginButton() {
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
              minimumSize: Size(120, 50))
          .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
      onPressed: () {
        final isValidFrom = formKey.currentState!.validate();
        if (isValidFrom) {
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
