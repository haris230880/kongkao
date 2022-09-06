
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import '../../Login/components/login_screen.dart';
import '../../Regis/components/regis.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "TO KONGKAO ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 50),
            Image.asset(
              "assets/icons/chatting.png",
              height: size.height * 0.3,
            ),
            SizedBox(
              height: 40,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                // Foreground color
                onPrimary: Colors.white,
                // Background color
                primary: kPrimaryColor,
                minimumSize: Size(300, 50),
              ).copyWith(elevation: ButtonStyleButton.allOrNull(1.0)),
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
              child: const Text('เข้าสู่ระบบ',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                  // Foreground color
                      onPrimary: Colors.white,
                      // Background color
                      primary: kPrimaryLightColor,
                      minimumSize: Size(300, 50))
                  .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
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
              child: const Text('สมัครสมาชิก',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
