import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:project/configs/services/datausersale.dart';
import 'package:project/my_style.dart';

import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../background_regis.dart';
import '../regis.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class BobyRegisterAddressSell extends StatefulWidget {
  const BobyRegisterAddressSell({Key? key}) : super(key: key);

  @override
  State<BobyRegisterAddressSell> createState() =>
      _BobyRegisterAddressSellState();
}

class _BobyRegisterAddressSellState extends State<BobyRegisterAddressSell> {

  @override
  void initState() {
    super.initState();
    findLatLngSale();
  }
  Future<Null> findLatLngSale() async {
    LocationData? locationData = await findlocationData();
    lat = locationData!.latitude!;
    lng = locationData!.longitude!;
    print('lat=$lat , lng=$lng');
    setState(() {
      MyStyle().showmap();
    });

  }//หาค่าlatlng
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              MyStyle().CircleAvatarusersale(),
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
                      'ลงทะเบียนผู้ขาย',
                      style: TextStyleblodgreen,
                    ),
                    Text(
                      'ที่อยู่',
                      style: TextStyle(
                          color: kPrimaryblckColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "กรอก บ้านเลขที่";
                          }
                          return null;
                        },
                        onChanged: (value) => selluser_housenum = value.trim(),
                        keyboardType: TextInputType.streetAddress,
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
                            'บ้านเลขที่',
                            style: TextStyle(color: kPrimaryblckColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก ตำบล";
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                selluser_district = value.trim(),
                            keyboardType: TextInputType.text,
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
                                'ตำบล',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก อำเภอ";
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                selluser_prefecture = value.trim(),
                            keyboardType: TextInputType.text,
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
                                'อำเภอ',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "กรอก จังหวัด";
                              }
                              return null;
                            },
                            onChanged: (value) => selluser_city = value.trim(),
                            keyboardType: TextInputType.text,
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
                                'จังหวัด',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5),
                            ],
                            validator: (value) {
                              if (value != null && value.length < 5) {
                                return "กรอก รหัสไปรษณีย์";
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                selluser_postid = value.trim(),
                            keyboardType: TextInputType.number,
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
                                ' รหัสไปรษณีย์ ',
                                style: TextStyle(color: kPrimaryblckColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(child: lat==null ?MyStyle().showProgress() :MyStyle().showmap(),),
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
                          .copyWith(
                              elevation: ButtonStyleButton.allOrNull(5.0)),
                      onPressed: () {
                        final isValidFrom = formKey.currentState!.validate();
                        if (isValidFrom) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisScreenSaleNumber();
                              },
                            ),
                          );
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
                              return RegisterSale();
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
      ),
    );
  }
}
