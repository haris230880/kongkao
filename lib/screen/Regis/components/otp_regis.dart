import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../constants.dart';




class Otp_Regis extends StatefulWidget {
  const Otp_Regis({Key? key}) : super(key: key);

  @override
  State<Otp_Regis> createState() => _Otp_RegisState();
}

class _Otp_RegisState extends State<Otp_Regis> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  Text('OTP'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    textFildotp(first: true, last: false),
                    textFildotp(first: false, last: false),
                    textFildotp(first: false, last: false),
                    textFildotp(first: false, last: true),
                  ],),


                  SizedBox(
                    height: 10,
                  ),
                  Text('กรุณากรอกรหัส OTP'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('ส่งรหัสอีกครั้ง'),
            ),
            Text('กรุณารอส่งรหัสอีกครั้งใน 2:33 นาที'),
            SizedBox(
              height: 10,
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
              child: const Text('ยืนยัน otp'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisScreen();
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
    );
  }
  textFildotp({required bool first, last}) {
    return Container(
        height: 85,
        child: AspectRatio(
          aspectRatio: 0.7,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if(value.length==1&&last==false){
                FocusScope.of(context).nextFocus();
              }  if(value.length==0&&first==false){
                FocusScope.of(context).previousFocus();
              }

            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: Colors.black26),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
              ),
            ),
          ),
        ));
  }
  }

