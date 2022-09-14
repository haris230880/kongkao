import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/winged/nomalDiolog.dart';
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
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.length < 10) {
                            return "กรอก เบอร์โทรศัพท์";
                          }
                          return null;
                        },
                        onChanged: (value) => buyuser_phone = value.trim(),
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
                  final isValidFrom = formKey.currentState!.validate();
                  if (isValidFrom) {
                    getHttpBuyuser();
                    //checkPhoneNumber();
                  }
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
      ),
    );
  }

  Future<Null> checkPhoneNumber() async {
    String url = API.BASE_URL +
        '/flutterApiProjeck/getUserWhereUserbay.php?isAdd=true&buyuser_phone=$buyuser_phone';
    try {
      Response response = await Dio().get(url);
      if (response.toString() == 'null') {
        getHttpBuyuser();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OtpScreen();
            },
          ),
        );
      } else {
        normaDiolog(
            context, 'เบอร์โทรศัพท์ซ้ำ $buyuser_phone กรุณาเปลี่ยนใหม่');
        print('$response');
      }
    } catch (e) {
      print(e);
    }
  }

  // void getHttpBuyuser() async {
  //   try {
  //     var response = await Dio().get(API.BASE_URL + '/flutterApiProjeck/insertDataBay.php?isAdd=true&buyuser_name=$buyuser_name&buyuser_sname=$buyuser_sname&buyuser_email=$buyuser_email&buyuser_shop=$buyuser_shop&buyuser_phone=$buyuser_phone&buyuser_time=$buyuser_time&buyuser_photo=NULL&buyuser_charge=$buyuser_charge&buyuser_latitude=NULL&buyuser_longitude=NULL&buyuser_district=$buyuser_district&buyuser_prefecture=$buyuser_prefecture&buyuser_city=$buyuser_city&buyuser_postid=$buyuser_postid&buyuser_housenum=$buyuser_housenum');
  //      print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  void getHttpBuyuser() async {
    String url = (API.BASE_URL +
        '/flutterApiProjeck/insertDataBay.php?isAdd=true&buyuser_name=$buyuser_name&buyuser_sname=$buyuser_sname&buyuser_email=$buyuser_email&buyuser_shop=$buyuser_shop&buyuser_phone=$buyuser_phone&buyuser_time=$buyuser_time&buyuser_photo=NULL&buyuser_charge=$buyuser_charge&buyuser_latitude=NULL&buyuser_longitude=NULL&buyuser_district=$buyuser_district&buyuser_prefecture=$buyuser_prefecture&buyuser_city=$buyuser_city&buyuser_postid=$buyuser_postid&buyuser_housenum=$buyuser_housenum');
    try {
      Response response = await Dio().get(url);
      print('res = $response');
      if (response.toString() == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OtpScreen();
            },
          ),
        );
      }else{
        normaDiolog(context, 'ไม่สามารสมัคได้ลองใหม่');
      }
    } catch (e) {
      print(e);
    }
  }
}
//    final isValidFrom = formKey.currentState!.validate();
//                   if (isValidFrom) {
//                     getHttpBuyuser();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return OtpScreen();
//                         },
//                       ),
//                     );
//                   }
