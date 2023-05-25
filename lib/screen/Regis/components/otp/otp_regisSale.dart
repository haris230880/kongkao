// import 'dart:math';
//
// import 'package:dio/dio.dart';
// import 'package:email_auth/email_auth.dart';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:project/configs/services/datauserbay.dart';
// import 'package:project/screen/Login/components/login_screen.dart';
// import 'package:project/screen/Regis/components/background_regis.dart';
// import 'package:project/screen/Regis/components/regis.dart';
//
// import '../../../../configs/services/api.dart';
// import '../../../../configs/services/datausersale.dart';
// import '../../../../constants.dart';
// import '../../../../future_All.dart';
// import '../bodyregister/body_register_sell.dart';
//
// class Otp_RegisSale extends StatefulWidget {
//   const Otp_RegisSale({Key? key}) : super(key: key);
//
//   @override
//   State<Otp_RegisSale> createState() => _Otp_RegisSaleState();
// }
//
// class _Otp_RegisSaleState extends State<Otp_RegisSale> {
//   bool submitValid = false;
//   TextEditingController countrycode = TextEditingController();
//   final TextEditingController _emailcontroller = TextEditingController();
//   final TextEditingController _otpcontroller = TextEditingController();
//   var phone = "";
//   var OTP = "";
//   static String verify = "";
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     countrycode.text = "+66";
//     // ตรวจสอบและเริ่ม Firebase
//   }
//
//   void uplodeimageusersaveusersale() async {
//     Random random = Random();
//     int i = random.nextInt(100000);
//     String nameimage = 'user$i.jpg';
//     String url = API.BASE_URL + '/kongkao/saveimage.php';
//     try {
//       Map<String, dynamic> map = Map();
//       map['file'] =
//           await MultipartFile.fromFile(fileusersell!.path, filename: nameimage);
//       FormData formData = FormData.fromMap(map);
//       await Dio().post(url, data: formData).then((value) {
//         print('value=====$value');
//         selluser_photo = '/kongkao/Image/$nameimage';
//         print('nameimage ======= $selluser_photo');
//         print('user_photo>>>>>$selluser_photo');
//         getHttpSaleuser();
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => LoginScreen(),
//             ));
//       });
//     } catch (e) {}
//   } //บันทึกข้อมูลผู้ขายเเละรูป
//
//   void getHttpSaleuser() async {
//     try {
//       var response = await Dio().get(API.BASE_URL +
//           '/kongkao/insertuser.php?id=3&name=$selluser_name&lastname=$selluser_sname&phone=$selluser_phone&email=$selluser_email&photo=$selluser_photo&typeuser=sale&password=$selluser_password&housenum=$selluser_housenum&district=$selluser_district&prefecture=$selluser_prefecture&city=$selluser_city&postid=$selluser_postid&latitude=$lat&longitude=$lng&charge=NULL&shop=NULL&time=NULL');
//       print(response);
//     } catch (e) {
//       print(e);
//     }
//   } //apiบันทึกข้อมูลผู้ขาย
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BackgroundRegis(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
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
//                   EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
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
//                   Container(
//                     height: 50,
//                     width: 340,
//                     child: TextFormField(
//                       onChanged: (value) {
//                         phone = value;
//                       },
//                       keyboardType: TextInputType.phone,
//                       cursorColor: kPrimaryColor,
//                       textAlignVertical: TextAlignVertical.center,
//                       decoration: InputDecoration(
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                         ),
//                         contentPadding: EdgeInsets.all(10),
//                         label: Text(
//                           'phone',
//                           style: TextStyle(color: kPrimaryblckColor),
//                         ),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             elevation: 5,
//                             // Foreground color
//                             onPrimary: Colors.white,
//                             // Background color
//                             primary: kPrimaryColor,
//                             minimumSize: Size(30, 50))
//                         .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
//                     onPressed: () async {
//                       await FirebaseAuth.instance.verifyPhoneNumber(
//                         phoneNumber: '${countrycode.text + phone}',
//                         verificationCompleted:
//                             (PhoneAuthCredential credential) {},
//                         verificationFailed: (FirebaseAuthException e) {},
//                         codeSent: (String verificationId, int? resendToken) {
//                           verify = verificationId;
//                         },
//                         codeAutoRetrievalTimeout: (String verificationId) {},
//                       );
//                       setState(() {
//                         submitValid = true;
//                       });
//                     },
//                     child: GestureDetector(
//                       // onTap: sendOtp,
//                       child: Center(
//                         child: Text(
//                           " ส่งรหัส OTP $phone",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   (submitValid)
//                       ? Container(
//                           height: 50,
//                           width: 340,
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value != null && value.isEmpty) {
//                                 return "กรอก OTP";
//                               }
//                               return null;
//                             },
//                             onChanged: (value) => OTP,
//                             controller: _otpcontroller,
//                             keyboardType: TextInputType.text,
//                             cursorColor: kPrimaryColor,
//                             textAlignVertical: TextAlignVertical.center,
//                             decoration: InputDecoration(
//                               filled: true,
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                               ),
//                               contentPadding: EdgeInsets.all(10),
//                               label: Text(
//                                 'OTP',
//                                 style: TextStyle(color: kPrimaryblckColor),
//                               ),
//                             ),
//                           ),
//                         )
//                       : Container(height: 1),
//                   (submitValid)
//                       ? ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   elevation: 5,
//                                   // Foreground color
//                                   onPrimary: Colors.white,
//                                   // Background color
//                                   primary: kPrimaryColor,
//                                   minimumSize: Size(30, 50))
//                               .copyWith(
//                                   elevation: ButtonStyleButton.allOrNull(5.0)),
//                           onPressed: () async {
//                             PhoneAuthCredential credential =
//                                 PhoneAuthProvider.credential(
//                                     verificationId: verify, smsCode: OTP);
//
//                             // Sign the user in (or link) with the credential
//                             await _auth.signInWithCredential(credential);
//                           },
//                           child: GestureDetector(
//                             // onTap: verify,
//                             child: Center(
//                               child: Text(
//                                 "ยืนยัน",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       : SizedBox(height: 1)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
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
  TextEditingController countrycode = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  var phone = "";
  var OTP = "";
  static String verify = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String otp = '';
  int otpTimeout = 0;

  @override
  void initState() {
    super.initState();
    countrycode.text = "+66";
    // ตรวจสอบและเริ่ม Firebase
  }
  List<TextEditingController> otpControllers = List.generate(6,(index) => TextEditingController(),);
  void uplodeimageusersaveusersale() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameimage = 'user$i.jpg';
    String url = API.BASE_URL + '/kongkao/saveimage.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(fileusersell!.path, filename: nameimage);
      FormData formData = FormData.fromMap(map);
      await Dio().post(url, data: formData).then((value) {
        print('value=====$value');
        selluser_photo = '/kongkao/Image/$nameimage';
        print('nameimage ======= $selluser_photo');
        print('user_photo>>>>>$selluser_photo');
        getHttpSaleuser();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    } catch (e) {}
  } //บันทึกข้อมูลผู้ขายเเละรูป

  void getHttpSaleuser() async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/insertuser.php?id=3&name=$selluser_name&lastname=$selluser_sname&phone=$selluser_phone&email=$selluser_email&photo=$selluser_photo&typeuser=sale&password=$selluser_password&housenum=$selluser_housenum&district=$selluser_district&prefecture=$selluser_prefecture&city=$selluser_city&postid=$selluser_postid&latitude=$lat&longitude=$lng&charge=NULL&shop=NULL&time=NULL');
      print(response);
    } catch (e) {
      print(e);
    }
  } //apiบันทึกข้อมูลผู้ขาย

  void startOtpTimer() {
    const otpTimeoutDuration =
        Duration(minutes: 2); // กำหนดเวลาของ OTP (เช่น 2 นาที)
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
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
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
                        label: Text(
                          'phone',
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
                        .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${countrycode.text + phone}',
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
                        setState(() {
                          submitValid = true;
                        });
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
                  ),
                  otpTimeout < 0
                      ? Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          6,
                              (index) => Container(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              controller: otpControllers[index],
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 1,
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
                          ),
                        ),
                      ),
                      Text('OTP จะสิ้นสุดใน ${otpTimeout.toString()} วินาที'),
                    ],
                  )
                      : SizedBox.shrink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
