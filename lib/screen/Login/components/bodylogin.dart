import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/main/main_user_bay.dart';
import 'package:project/main/main_user_sell.dart';
import 'package:project/model/user_model.dart';
import 'package:project/screen/winged/bottomnavigatonbar.dart';
import 'package:project/screen/Login/components/backgroundlogin.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../configs/String.dart';
import '../../../constants.dart';
import '../../winged/nomalDiolog.dart';
import 'package:dio/dio.dart';

class BodyLogin extends StatefulWidget {
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}
class _BodyLoginState extends State<BodyLogin> {
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
                      child:  TextFormField(
                        validator: (value) {
                          if (value != null && value.length < 10) {
                            return "กรอก หมายเลขโทรศัพท 10 ตัว";
                          }
                          return null;
                        },
                        onChanged: (value) => phone_number = value.trim(),
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
              ),
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






  //--------------------//
  Future<Null> checkAuthen() async {
    String url = API.BASE_URL + '/flutterApiProjeck/getUserWhereUser.php?isAdd=true&phone_number=$phone_number';
    try {
      Response response = await Dio().get(url);
      print('res = $response');
      var reslt = jsonDecode(response.data);
      print('reslt = $reslt');

      for (var map in reslt) {
        UserLoginModel userLoginModel = UserLoginModel.fromJson(map);
        if (password == userLoginModel.password) {
          String? choseType = userLoginModel.typeUser;
          if(choseType =='1'){routetoservice(HomePage(),userLoginModel);
          }else if (choseType == '2'){routetoservice(MainUserBay(),userLoginModel);
          }
        } else {
          normaDiolog(context, 'หมายเลขโทรศัพท หรือ รหัสผ่าน ไม่ถูกต้อง');
        }
      }
    } catch (e) {}
  }//ตรวจสอบการเข้าสู่ระบบ
  Future<Null> routetoservice(Widget mywidget, UserLoginModel userLoginModel) async{
  SharedPreferences preferences =await SharedPreferences.getInstance();

        preferences.setString('ID',userLoginModel.userId);
        preferences.setString('phoneNumber', userLoginModel.phoneNumber);
        preferences.setString('Type', userLoginModel.typeUser);

    MaterialPageRoute route = MaterialPageRoute(builder:(context) => mywidget,);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);//ซ้อนpassword
}
