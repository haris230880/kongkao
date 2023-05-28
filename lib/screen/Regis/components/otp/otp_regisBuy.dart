// import 'package:email_auth/email_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project/configs/services/datauserbay.dart';
// import 'package:project/screen/Login/components/login_screen.dart';
// import 'package:project/screen/Regis/components/background_regis.dart';
// import 'package:project/screen/Regis/components/regis.dart';
//
// import '../../../constants.dart';
//
//
//
//
// class Otp_Regis extends StatefulWidget {
//   const Otp_Regis({Key? key}) : super(key: key);
//
//   @override
//   State<Otp_Regis> createState() => _Otp_RegisState();
// }
//
// class _Otp_RegisState extends State<Otp_Regis> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BackgroundRegis(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Kongkao",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Image.asset(
//               'assets/images/logo.jpg',
//               scale: 10,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: EdgeInsets.all(20),
//               padding:
//               EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 20),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: kPrimaryColor),
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 2,
//                         color: kPrimaryColor,
//                         offset: Offset(1, 1))
//                   ]),
//               child: Column(
//                 children: <Widget>[
//                   Text('OTP'),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                     textFildotp(first: true, last: false),
//                     textFildotp(first: false, last: false),
//                     textFildotp(first: false, last: false),
//                     textFildotp(first: false, last: true),
//                   ],),
//
//
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text('กรุณากรอกรหัส OTP'),
//                 ],
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text('ส่งรหัสอีกครั้ง'),
//             ),
//             Text('กรุณารอส่งรหัสอีกครั้งใน 2:33 นาที'),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 5,
//                   // Foreground color
//                   onPrimary: Colors.white,
//                   // Background color
//                   primary: kPrimaryColor,
//                   minimumSize: Size(30, 50))
//                   .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginScreen();
//                     },
//                   ),
//                 );
//               },
//               child: const Text('ยืนยัน otp'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return RegisScreen();
//                     },
//                   ),
//                 );
//               },
//               child: const Text(
//                 'ยกเลิก',
//                 style: TextStyle(color: kPrimaryLightColor),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   textFildotp({required bool first, last}) {
//     return Container(
//         height: 85,
//         child: AspectRatio(
//           aspectRatio: 0.7,
//           child: TextField(
//             autofocus: true,
//             onChanged: (value) {
//               if(value.length==1&&last==false){
//                 FocusScope.of(context).nextFocus();
//               }  if(value.length==0&&first==false){
//                 FocusScope.of(context).previousFocus();
//               }
//
//             },
//             showCursor: false,
//             readOnly: false,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             keyboardType: TextInputType.number,
//             maxLength: 1,
//             decoration: InputDecoration(
//               counter: Offstage(),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(width: 2, color: Colors.black26),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(width: 2, color: kPrimaryColor),
//               ),
//             ),
//           ),
//         ));
//   }
//   }
//


import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/services/datauserbay.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../../configs/services/api.dart';
import '../../../../configs/services/datausersale.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../bodyregister/body_register_bay.dart';
import '../bodyregister/body_register_sell.dart';

class Otp_RegisBuy extends StatefulWidget {
  const Otp_RegisBuy({Key? key}) : super(key: key);

  @override
  State<Otp_RegisBuy> createState() => _Otp_RegisBuyState();
}

class _Otp_RegisBuyState extends State<Otp_RegisBuy> {
  /// The boolean to handle the dynamic operations
  bool submitValid = false;
  var phone = "";
  var OTP = "";
  /// Text editing controllers to get the value from text fields
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  TextEditingController countrycode = TextEditingController();
  static String verify = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Declare the object
  late EmailAuth emailAuth;
  int otpTimeout = 0;
  @override
  void initState() {
    super.initState();
    countrycode.text = "+66";


  }

  void startOtpTimer() {
    const otpTimeoutDuration =
    Duration(minutes:2); // กำหนดเวลาของ OTP (เช่น 2 นาที)
    setState(() {
      otpTimeout = otpTimeoutDuration.inSeconds;
    });
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        otpTimeout--;
      });
      if (otpTimeout <= 0) {
        timer.cancel();
      }
    });
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



  void showSuccessMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

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
                  Text('OTP'),
                  SizedBox(
                    height: 10,
                  ),


                  Container(
                    height: 70,
                    width: 340,
                    child: TextFormField(
                      onChanged: (value) {
                        phone = value;
                      },
                      keyboardType: TextInputType.phone,
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
                          labelText: 'Phone',
                          labelStyle: TextStyle(color: kPrimaryblckColor),
                          prefixIcon:  Icon(
                            Icons.phone,
                            size: 25,
                            color: kPrimaryColor,
                          )
                      ),
                    ),

                  ),
                  otpTimeout > 0
                      ? Column(
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          OTP=value;

                        },
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          counterText: '', // Hide character count
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(10),
                        ),
                        style: TextStyle(fontSize: 20),
                      ),

                      Text('OTP จะสิ้นสุดใน ${otpTimeout.toString()} วินาที'),
                    ],
                  )
                      : SizedBox.shrink(),
                  otpTimeout > 0
                      ?ElevatedButton(
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
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verify, smsCode:OTP);
                        print('$OTP,$phone');
                        await _auth.signInWithCredential(credential);
                        uplodeimageusersaveuserbuy();
                        // showSuccessMessage("$OTP,$phone");
                      } catch (e) { print(e);
                      showErrorMessage('Error sending OTP: $e');
                      }
                      print(OTP);

                    },
                    child:Text(
                      "ยืนยัน",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )//ส่งotp
                      :ElevatedButton(
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
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${countrycode.text + phone}',
                          timeout: Duration(minutes: 2),
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {
                            showErrorMessage('OTP verification failed: ${e.message}');
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            verify = verificationId;
                            startOtpTimer(); // Start the OTP timer
                            showSuccessMessage('OTP sent successfully');
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      } catch (e) {
                        showErrorMessage('Error sending OTP: $e');
                      }
                    },
                    child:Text(
                      " ส่งรหัส OTP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )//ส่


                ],
              ),
            ),




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




  void uplodeimageusersaveuserbuy() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameimage = 'user$i.jpg';
    String url = API.BASE_URL + '/kongkao/saveimage.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
      await MultipartFile.fromFile(fileuserbuy!.path, filename: nameimage);
      FormData formData = FormData.fromMap(map);
      await Dio().post(url, data: formData).then((value) {
        print('value=====$value');
        buyuser_photo = '/kongkao/Image/$nameimage';
        print('nameimage ======= $buyuser_photo');
        print('user_photo>>>>>$buyuser_photo');
        getHttpBuyuser();
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));


      });
    } catch (e) {}
  } //บันทึกข้อมูลผู้ซื้อเละรูป

  void getHttpBuyuser() async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/insertuser.php?id=3&name=$buyuser_name&lastname=$buyuser_sname&phone=$buyuser_phone&email=$buyuser_email&photo=$buyuser_photo&typeuser=buy&password=$buyuser_password&housenum=$buyuser_housenum&district=$buyuser_district&prefecture=$buyuser_prefecture&city=$buyuser_city&postid=$buyuser_postid&latitude=$lat&longitude=$lng&charge=$buyuser_charge&shop=$buyuser_shop&time=$buyuser_time');
      print(response);
    } catch (e) {
      print(e);
    }
  } //apiบันทึกข้อมูลผู้ซื้อ


  Future<Null> chackUser() async {
    String url = API.BASE_URL +
        '/kongkao/insertuserphone.php?isAdd=true&phone=$buyuser_phone';
    try {
      Response response = await Dio().get(url);
      print(response);
      if (response.toString() == 'null') {
        uplodeimageusersaveuserbuy();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OtpScreenSale();
            },
          ),
        );
      } else {
        normaDiolog(context, 'เบอร์ผู้ใช้ซ้ำ');
      }
    } catch (e) {}
  }
}
