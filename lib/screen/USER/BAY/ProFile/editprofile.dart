import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/HOME/components/appbarhomepagebay.dart';
import 'package:project/screen/USER/BAY/Product/addproduct.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';

import '../../../../configs/services/api.dart';
import '../../../../future_All.dart';
import '../../../../my_style.dart';
import '../HomePageBay.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'EditProfile',
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          maxRadius: 50,
                          child: userphoto == null
                              ? Image.asset('assets/icons/userbay.png')
                              : CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage: NetworkImage(
                                      API.BASE_URL + '$userphoto'))),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: Text('เปลี่ยนรูป')),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'บัญชีขอฉัน',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          containerfile('ชื่อ: $username'),
                          SizedBoxprofile(),
                          containerfile('นามสกุล: $userlastname'),
                          SizedBoxprofile(),
                          containerfile('เบอร์โทรศัพท์: $userphone'),
                          SizedBoxprofile(),
                          containerfile('อีเมล: $useremail'),
                          SizedBoxprofile(),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ที่อยู่',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  SizedBoxprofile(),
                  Container(
                    child: Column(children: [
                      containerfile('บ้านเลขที่: $userhousenum'),
                      SizedBoxprofile(),
                      containerfile('ตำบล: $userdistrict'),
                      SizedBoxprofile(),
                      containerfile('อำเภอ: $userprefecture'),
                      SizedBoxprofile(),
                      containerfile('จังหวัด: $usercity'),
                      SizedBoxprofile(),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ร้านค้า',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          containerfile('ชื่อร้าน: $usershop'),
                          SizedBoxprofile(),
                          containerfile('ค่าบริการ: $usercharge'),
                          SizedBoxprofile(),
                          containerfile('เวลาทำการ: $usertime '),
                          SizedBoxprofile(),
                        ]),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 5,
                              // Foreground color
                              onPrimary: Colors.white,
                              // Background color
                              primary: kPrimaryColor,
                              minimumSize: Size(120, 50))
                          .copyWith(
                              elevation: ButtonStyleButton.allOrNull(2.0)),
                      onPressed: () {
                        // final isValidFrom = formKey.currentState!.validate();
                        // if (isValidFrom) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => HomePageBay(),
                        //       ));
                        // } else {
                        //   normaDiolog(context, 'กรอกข้อมูลให้ครบ');
                        // }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text('ยืนยัน'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 5,
                              // Foreground color
                              onPrimary: Colors.white,
                              // Background color
                              primary: Colors.red,
                              minimumSize: Size(120, 50))
                          .copyWith(
                              elevation: ButtonStyleButton.allOrNull(2.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageBay(),
                            ));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.cancel),
                          SizedBox(
                            width: 5,
                          ),
                          Text('ยกเลิก'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  SizedBox SizedBoxprofile() {
    return SizedBox(
      height: 10,
    );
  }

  Container containerfile(String namefile) {
    return Container(
      height: 50,
      width: 350,
      child: TextFormField(
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "กรอก ข้อมูล";
          }
          return null;
        },
        // onChanged: (value) =>  = value.trim(),
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
            ' $namefile',
            style: TextStyle(color: kPrimaryblckColor),
          ),
        ),
      ),
    );
  }
}
