import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screen/Home/components/homeset.dart';
import 'package:project/screen/Home/components/home_screen.dart';
import 'package:project/screen/Login/components/backgroundlogin.dart';
import 'package:project/screen/Welcome/components/welcomeScreen.dart';

import '../../../constants.dart';

class BodyLogin extends StatefulWidget {
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  bool isHidden = false;
  final _numbeController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _numbeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
      child: SingleChildScrollView(
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
                    child: TextField(
                      controller: _numbeController,
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
                            style: TextStyle(color: kPrimaryblckColor,fontSize: 14),
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
                    child: TextField(
                      controller: _passwordController,
                      obscureText: isHidden,
                      keyboardType: TextInputType.name,
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
                            style: TextStyle(color: kPrimaryblckColor,fontSize: 14),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
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
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
