import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/body_set_password.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../constants.dart';

class Otp_Regis extends StatelessWidget {
  const Otp_Regis({Key? key}) : super(key: key);

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
            SizedBox(height: 10,),
            Image.asset('assets/images/logo.jpg',scale: 10,),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin1){},
                          decoration: InputDecoration(hintText: '0',hintStyle: TextStyle(color: Colors.black12)),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin2){},
                          decoration: InputDecoration(hintText: '0',hintStyle: TextStyle(color: Colors.black12)),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin3){},
                          decoration: InputDecoration(hintText: '0',hintStyle: TextStyle(color: Colors.black12)),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (pin4){},
                          decoration: InputDecoration(hintText: '0',hintStyle: TextStyle(color: Colors.black12)),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('กรุณากรอกรหัส OTP'),
                ],
              ),
            ),
            TextButton(onPressed: (){}, child: Text('ส่งรหัสอีกครั้ง'),),
            Text('กรุณารอส่งรหัสอีกครั้งใน 2:33 นาที'),
            SizedBox(height: 10,),
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
                      return SetPassWord();
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
}
