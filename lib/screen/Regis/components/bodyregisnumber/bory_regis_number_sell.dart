import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/otp_regis.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../../constants.dart';
import '../../../Login/components/login_screen.dart';
import '../../../Welcome/components/welcomeScreen.dart';

class BodyRegisNumberSale extends StatefulWidget {
  const BodyRegisNumberSale({Key? key}) : super(key: key);

  @override
  State<BodyRegisNumberSale> createState() => _BodyRegisNumberSaleState();
}

class _BodyRegisNumberSaleState extends State<BodyRegisNumberSale> {
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
              height: 20,
            ),
            CircleAvatar(
              maxRadius: 100,
              backgroundColor: kPrimaryColor,
              child: Image.asset('assets/icons/usersale.png'),
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
                  Text(
                    "ลงทะเบียน ผู้ขาย",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      cursorColor: kPrimaryColor,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: kPrimaryColor)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: kPrimaryLightColor),
                        ), //เปลียนสีเส้นขอบเมื่อกด
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        label: Text(
                          'เบอร์โทรศัพท์ ',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: kPrimaryColor,
                        ),
                      ),
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
                  minimumSize: Size(100, 50))
                  .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
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
              child: const Text('ถัดไป'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterAddressSell();
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
}
