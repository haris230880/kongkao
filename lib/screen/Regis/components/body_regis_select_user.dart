import 'package:flutter/material.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../constants.dart';
import '../../Login/components/login_screen.dart';
import '../../Welcome/components/welcomeScreen.dart';

class BodyRegisSelectUser extends StatelessWidget {
  const BodyRegisSelectUser({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ลงทะเบียน",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/logo.jpg",
              height: size.height * 0.2,
            ),
            SizedBox(height: 12,),
            // Text(
            //   "ลงทะเบียน ",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            // ),
            Container(
              margin: EdgeInsets.all(20),
              padding:
                  EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: kPrimaryColor
                  //     ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: kPrimaryColor,
                        offset: Offset(1, 1))
                  ]
                  ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: kPrimaryColor,
                        child: Image.asset('assets/icons/usersale.png'),
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
                            .copyWith(
                                elevation: ButtonStyleButton.allOrNull(5.0)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterSale();
                              },
                            ),
                          );
                        },
                        child: const Text('ผู้ขาย '),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding:
                  EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: kPrimaryColor // Set border color
                  //     ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: kPrimaryColor,
                        offset: Offset(1, 1))
                  ]
                  ),
              child: Column(
                children: <Widget>[

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: kPrimaryColor,
                        child: Image.asset('assets/icons/userbay.png'),
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
                                minimumSize: Size(120,50))
                            .copyWith(
                                elevation: ButtonStyleButton.allOrNull(5.0)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterBay();
                              },
                            ),
                          );
                        },
                        child: const Text('ผู้ซื้อ'),
                      ),
                    ],
                  ),
                ],
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
}
