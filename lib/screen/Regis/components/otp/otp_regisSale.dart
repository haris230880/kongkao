

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:email_auth/email_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/services/datauserbay.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../../configs/services/api.dart';
import '../../../../configs/services/datausersale.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../bodyregister/body_register_sell.dart';

class Otp_RegisSale extends StatefulWidget {
  const Otp_RegisSale({Key? key}) : super(key: key);

  @override
  State<Otp_RegisSale> createState() => _Otp_RegisSaleState();
}

class _Otp_RegisSaleState extends State<Otp_RegisSale> {

  bool submitValid = false;


  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  String? _verificationId;

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  void initializeFirebase() {
    Firebase.initializeApp();
  }

  void sendOtp() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _emailcontroller.value.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            submitValid = true;
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }
  void verify() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: _otpcontroller.value.text);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        print('OTP Verified');
        uplodeimageusersaveusersale();
      } else {
        print('Invalid OTP');
        normaDiolog(context, "OTP ไม่ถูกต้อง");
      }
    } catch (e) {
      print(e.toString());
    }
  }



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
                  EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
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


                  Container(
                    height: 50,
                    width: 340,
                    child: TextFormField(
                      onChanged: (value) => selluser_email  = value.trim(),
                      controller: _emailcontroller,
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
                          'Email',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                      ),
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
                        minimumSize: Size(30, 50))
                        .copyWith(
                        elevation: ButtonStyleButton.allOrNull(5.0)),
                    onPressed: () {},
                    child:GestureDetector(
                      onTap: sendOtp,
                      child: Center(
                        child: Text(
                          " ส่งรหัส OTP ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  (submitValid)
                      ? Container(
                          height: 50,
                          width: 340,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก OTP";
                              }
                              return null;
                            },
                            // onChanged: (value) =>  = value.trim(),
                            controller: _otpcontroller,
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
                                'OTP',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        )
                      : Container(height: 1),

                  (submitValid)
                      ? ElevatedButton(
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
                              .copyWith(
                                  elevation: ButtonStyleButton.allOrNull(5.0)),
                          onPressed: () {



                          },
                          child: GestureDetector(
                            onTap: verify, 
                            child: Center(
                              child: Text("ยืนยัน",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(height: 1)


                ],
              ),
            ),


            //
            // TextButton(
            //   onPressed: () {},
            //   child: Text('ส่งรหัสอีกครั้ง'),
            // ),
            // Text('กรุณารอส่งรหัสอีกครั้งใน 2:33 นาที'),
            // SizedBox(
            //   height: 10,
            // ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //           elevation: 5,
            //           // Foreground color
            //           onPrimary: Colors.white,
            //           // Background color
            //           primary: kPrimaryColor,
            //           minimumSize: Size(30, 50))
            //       .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return LoginScreen();
            //         },
            //       ),
            //     );
            //   },
            //   child: const Text('ยืนยัน otp'),
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return RegisScreen();
            //         },
            //       ),
            //     );
            //   },
            //   child: const Text(
            //     'ยกเลิก',
            //     style: TextStyle(color: kPrimaryLightColor),
            //   ),
            // )



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
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
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
Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

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


}
