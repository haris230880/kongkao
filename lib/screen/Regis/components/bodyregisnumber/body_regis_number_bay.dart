import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../../configs/datauserbay.dart';
import '../../../../constants.dart';
import '../background_regis.dart';
import 'package:dio/dio.dart';

class BodyRegisNumberBay extends StatefulWidget {
  const BodyRegisNumberBay({Key? key}) : super(key: key);

  @override
  State<BodyRegisNumberBay> createState() => _BodyRegisNumberBayState();
}

class _BodyRegisNumberBayState extends State<BodyRegisNumberBay> {
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
              child: Image.asset('assets/icons/userbay.png'),
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
                    "ลงทะเบียน ผู้ซื้อ",
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
                      onChanged: (value) => antique_phonenumber=value.trim(),
                      keyboardType: TextInputType.phone,
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
                getHttpAntique();
                print('$antique_name$antique_locationhousenumber$antique_phonenumber');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return OtpScreen();
                //     },
                //   ),
                // );
              },
              child: const Text('ถัดไป'),
            ),

            TextButton(
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

void getHttpAntique() async {
  try {
    var response = await Dio().get(API.BASE_URL+'/flutterApiProjeck/insertDataBay.php?antique_name=$antique_name&antique_lastname=$antique_lastname&antique_email=$antique_email&antique_shopname=$antique_shopname&antique_photo=null&antique_workingtime=$antique_workingtime&antique_phonenumber=$antique_phonenumber&antique_service=$antique_service&antique_gpslatitude=00&antique_gpslongitude=00&antique_locationparish=$antique_locationparish&antique_locationdistrict=$antique_locationdistrict&antique_locationcity=$antique_locationcity&antique_postcode=$antique_postcode&antique_locationhousenumber=$antique_locationhousenumber');
    print(response);
  } catch (e) {
    print(e);
  }
}





}

