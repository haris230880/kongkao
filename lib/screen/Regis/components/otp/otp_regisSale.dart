
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class OtpRegisSale extends StatefulWidget {
  const OtpRegisSale({Key? key}) : super(key: key);

  @override
  State<OtpRegisSale> createState() => _OtpRegisSaleState();
}

class _OtpRegisSaleState extends State<OtpRegisSale> {
  bool submitValid = false;
  final TextEditingController _emailController = TextEditingController();

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
      await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: _emailController!.value.text,
        actionCodeSettings: ActionCodeSettings(
          url: 'https://kongkao-a57dc.firebaseapp.com/__/auth/action?mode=action&oobCode=code', // URL ที่ผู้ใช้ต้องกลับมาหลังจากยืนยันอีเมล
          handleCodeInApp: true,
          androidPackageName: 'com.example.app', // ชื่อแพ็กเกจของแอป Android
          androidInstallApp: true,
          androidMinimumVersion: '12', // เวอร์ชัน Android ขั้นต่ำที่ต้องการ

        ),
      );
      print('OTP Sent');
    } catch (e) {
      print(e.toString());
    }
  }


  void verify() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailLink(
        email: _emailController.value.text,
        emailLink: 'https://example.com', // URL ที่ผู้ใช้ใช้เพื่อเข้าสู่ระบบหลังจากยืนยันอีเมล
      );
      User? user = userCredential.user;

      if (user != null) {
        print('OTP Verified');
        // ดำเนินการที่คุณต้องการหลังจากตรวจสอบ OTP สำเร็จ
      } else {
        print('Invalid OTP');
        // แสดงข้อความหรือดำเนินการเพิ่มเติมเมื่อ OTP ไม่ถูกต้อง
      }
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Kongkao",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/logo.jpg',
              scale: 10,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.blue,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Text('OTP'),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 340,
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.blue,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        label: Text(
                          'Email',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: sendOtp,
                    child: Center(
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (submitValid)
                    Container(
                      height: 50,
                      width: 340,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.blue,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'OTP',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  if (submitValid)
                    ElevatedButton(
                      onPressed: verify,
                      child: Center(
                        child: Text(
                          "Verify",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  normaDiolog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("OTP Verification"),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
