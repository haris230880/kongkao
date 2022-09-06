import 'package:flutter/material.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../../configs/datauserbay.dart';
import '../../../../constants.dart';
import '../../../Login/components/login_screen.dart';
import '../background_regis.dart';



class BodyRegisterBay extends StatefulWidget {
  const BodyRegisterBay({Key? key}) : super(key: key);

  @override
  State<BodyRegisterBay> createState() => _BodyRegisterBayState();
}

class _BodyRegisterBayState extends State<BodyRegisterBay> {

  @override
  Widget build(BuildContext context) {
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(
              height: 10,
            ),
            CircleAvatar(minRadius: 70,
              backgroundColor: kPrimaryLightColor,
              child: Image.asset(
                'assets/icons/userbay.png',
                scale: 4,
              ),),
            //ใส่รุปป
            TextButton(onPressed: (){}, child: Text('เปลี่ยนรูป'),),
            Container(
              margin: EdgeInsets.all(30),
              padding:
              EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ลงทะเบียนผู้ซื้อ',
                    style: TextStyleblodgreen,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      onChanged: (value) => antique_name=value.trim(),
                      keyboardType: TextInputType.name,
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
                          'ชื่อ',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                        prefixIcon:  Icon(
                          Icons.account_circle,
                          size: 25,
                          color:kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      onChanged: (value) => antique_lastname=value.trim(),
                      keyboardType: TextInputType.name,
                      cursorColor: kPrimaryColor,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'นามสกุล',
                            style: TextStyle(color: kPrimaryblckColor),
                          ),
                          prefixIcon:  Icon(
                            Icons.account_circle_outlined,
                            size: 25,
                            color: kPrimaryColor,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 350,
                    child: TextField(
                      onChanged: (value) => antique_email=value.trim(),
                      cursorColor: kPrimaryColor,
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'อีเมล',
                            style: TextStyle(color: kPrimaryblckColor),
                          ),
                          prefixIcon:  Icon(
                            Icons.email,
                            size: 25,
                            color: kPrimaryColor,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),


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
                        minimumSize: Size(100, 50))
                        .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RegisterAddressBay();
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
                            return RegisScreen();
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
          ],
        ),
      ),
    );
  }
}
