import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../constants.dart';
import 'background_regis.dart';

class BodySetPassWord extends StatefulWidget {
  const BodySetPassWord({Key? key}) : super(key: key);

  @override
  State<BodySetPassWord> createState() => _BodySetPassWordState();
}

class _BodySetPassWordState extends State<BodySetPassWord> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Kongkao",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/logo.jpg',
              scale: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
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
                  Text('password'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      obscureText: isHidden,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.all(10),
                        hintText: ('รหัสผ่าน'),
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      obscureText: isHidden,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.all(10),
                        hintText: ('ยืนยันรหัสผ่าน'),
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
                            minimumSize: Size(30, 50))
                        .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: const Text('ยืนยัน'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OtpScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(color: kPrimaryLightColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
