import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/future_All.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../../configs/services/datauserbay.dart';
import '../../../../configs/services/api.dart';
import '../../../../constants.dart';
import '../../../../my_style.dart';
import '../../../USER/BAY/Product/addproduct.dart';
import '../background_regis.dart';
import 'package:email_validator/email_validator.dart';



File? fileuserbuy;
class BodyRegisterBay extends StatefulWidget {
  const BodyRegisterBay({Key? key}) : super(key: key);

  @override
  State<BodyRegisterBay> createState() => _BodyRegisterBayState();
}

class _BodyRegisterBayState extends State<BodyRegisterBay> {


  Future<Null> chooseImageuserbuy(ImageSource imageSource) async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameimage = 'userbuy$i.jpg';
    try {
      var object = await ImagePicker.platform.pickImage(
        source: imageSource,
        maxHeight: 800.0,
        maxWidth: 800.0,
      );
      setState(() {
        fileuserbuy = File(object!.path);
      });
    } catch (e) {}
  }//เก็บรูปในเเครื่อง
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
              MyStyle().CircleAvataruserbuy(),
              TextButton(
                onPressed: () => chooseImageuserbuy(ImageSource.camera),
                child: Text('เปลี่ยนรูป'),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.all(20),
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
                      height: 70,
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "กรอก ชื่อ";
                          }
                          return null;
                        },
                        onChanged: (value) => buyuser_name = value.trim(),
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
                          prefixIcon: Icon(
                            Icons.account_circle,
                            size: 25,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "กรอก นามสกุล";
                          }
                          return null;
                        },
                        onChanged: (value) => buyuser_sname = value.trim(),
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
                            prefixIcon: Icon(
                              Icons.account_circle_outlined,
                              size: 25,
                              color: kPrimaryColor,
                            )),
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
                          .copyWith(
                              elevation: ButtonStyleButton.allOrNull(5.0)),
                      onPressed: () {
                        final isValidFrom = formKey.currentState!.validate();
                        if (isValidFrom ) {
                          if(fileuserbuy == null){
                            normaDiolog(context, 'กรุณาเลือกรูปภาพ');
                          }else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterAddressBay();
                                },
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('ถัดไป'),
                    ),
                    TextButton(
                      onPressed: () {
                        fileuserbuy=null;
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
      ),
    );
  }
}
