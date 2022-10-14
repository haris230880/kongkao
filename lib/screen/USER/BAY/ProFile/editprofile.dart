import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:project/configs/datauserbay.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/HOME/components/appbarhomepagebay.dart';
import 'package:project/screen/USER/BAY/Product/addproduct.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../configs/services/api.dart';
import '../../../../future_All.dart';
import '../../../../my_style.dart';
import '../../../Regis/components/bodyregister/body_register_bay.dart';
import '../HomePageBay.dart';

File? editfileuser;

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  void initState() {
    super.initState();
    findLatLngBuy();
  }

  Future<Null> findLatLngBuy() async {
    LocationData? locationData = await findlocationData();
    lat = locationData!.latitude!;
    lng = locationData!.longitude!;
    print('lat=$lat , lng=$lng');
    setState(() {
      MyStyle().showmap();
    });
  } //หาค่าlatlng

  void uplodeimageusersaveuserbuyedit() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameimage = 'user$i.jpg';
    String url = API.BASE_URL + '/kongkao/saveimage.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(editfileuser!.path, filename: nameimage);
      FormData formData = FormData.fromMap(map);
      await Dio().post(url, data: formData).then((value) {
        print('value=====$value');
        userphoto = '/kongkao/Image/$nameimage';
        print('nameimage ======= $userphoto');
        print('user_photo>>>>>$userphoto');
        getHttpEdituser();
      });
    } catch (e) {}
  } //บันทึกข้อมูลผู้ซื้อเละรูป

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
        editfileuser = File(object!.path);
      });
    } catch (e) {}
  } //เก็บรูปในเเครื่อง

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
                    children: [MyStyle().CircleAvataruseredit()],
                  ),
                ),
                TextButton(
                    onPressed: () => chooseImageuserbuy(ImageSource.camera),
                    child: Text(
                      'เปลี่ยนรูป',
                      style: TextStyle(color: kPrimaryColor),
                    )),
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
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFieldusername(),
                          ),
                          SizedBoxprofile(),
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFielduserlastname(),
                          ),
                          SizedBoxprofile(),
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFielduseruserphone(),
                          ),
                          SizedBoxprofile(),
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFielduseruseremail(),
                          ),
                          SizedBoxprofile(),
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFielduserpassword(),
                          ),
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
                      SizedBoxprofile(),
                      Container(
                        height: 50,
                        width: 350,
                        child: buildTextFormFielduserhousenum(),
                      ),
                      SizedBoxprofile(),
                      Container(
                        height: 50,
                        width: 350,
                        child: buildTextFormFielduserdistrict(),
                      ),
                      SizedBoxprofile(),
                      Container(
                        height: 50,
                        width: 350,
                        child: buildTextFormFielduserprefecture(),
                      ),
                      SizedBoxprofile(),
                      Container(
                        height: 50,
                        width: 350,
                        child: buildTextFormFieldusercity(),
                      ),
                      SizedBoxprofile(),
                      Container(
                        height: 50,
                        width: 350,
                        child: buildTextFormFielduserpostid(),
                      ),
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
                          SizedBoxprofile(),
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFieldusershop(),
                          ),
                          SizedBoxprofile(),
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFieldusercharge(),
                          ),
                          SizedBoxprofile(),
                          Container(
                            height: 50,
                            width: 350,
                            child: buildTextFormFieldusertime(),
                          ),
                          Container(
                              height: 300,
                              width: 350,
                              child: lat == null
                                  ? MyStyle().showProgress()
                                  : MyStyle().showmap()),
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
                        uplodeimageusersaveuserbuyedit();
                        //getHttpEdituser();
                        Navigator.pop(context);
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
                        editfileuser = null;
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

  TextFormField buildTextFormFieldusername() {
    return TextFormField(
      onChanged: (value) => username = value.trim(),
      initialValue: username,
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
          'ชื่อ:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduserlastname() {
    return TextFormField(
      onChanged: (value) => userlastname = value.trim(),
      initialValue: userlastname,
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
          'นามสกุล:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduseruserphone() {
    return TextFormField(
      onChanged: (value) => userphone = value.trim(),
      initialValue: userphone,
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
          'เบอร์โทรศัพท์:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduseruseremail() {
    return TextFormField(
      onChanged: (value) => useremail = value.trim(),
      initialValue: useremail,
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
          'อีเมล:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduserpassword() {
    return TextFormField(
      onChanged: (value) => userpassword = value.trim(),
      initialValue: userpassword,
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
          'รหัสผ่าน:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduserhousenum() {
    return TextFormField(
      onChanged: (value) => userhousenum = value.trim(),
      initialValue: userhousenum,
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
          'บ้านเลขที่:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduserdistrict() {
    return TextFormField(
      onChanged: (value) => userdistrict = value.trim(),
      initialValue: userdistrict,
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
          'ตำบล:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduserprefecture() {
    return TextFormField(
      onChanged: (value) => userprefecture = value.trim(),
      initialValue: userprefecture,
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
          'อำเภอ:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldusercity() {
    return TextFormField(
      onChanged: (value) => usercity = value.trim(),
      initialValue: usercity,
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
          'จังหวัด:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFielduserpostid() {
    return TextFormField(
      onChanged: (value) => userpostid = value.trim(),
      initialValue: userpostid,
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
          'รหัสไปรษณีย์:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldusercharge() {
    return TextFormField(
      onChanged: (value) => usercharge = value.trim(),
      initialValue: usercharge,
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
          'ค่าบริการ:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldusershop() {
    return TextFormField(
      onChanged: (value) => usershop = value.trim(),
      initialValue: usershop,
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
          'ร้าน:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldusertime() {
    return TextFormField(
      onChanged: (value) => usertime = value.trim(),
      initialValue: usertime,
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
          'เวลาเปิด:',
          style: TextStyle(color: kPrimaryblckColor),
        ),
      ),
    );
  }

  SizedBox SizedBoxprofile() {
    return SizedBox(
      height: 10,
    );
  }

  void getHttpEdituser() async {
    print(username);
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/updateuser.php?isAdd=true&name=$username&lastname=$userlastname&phone=$userphone&email=$useremail&photo=$userphoto&typeuser=$usertype&password=$userpassword&housenum=$userhousenum&district=$userdistrict&prefecture=$userprefecture&city=$usercity&postid=$userpostid&latitude=$lat&longitude=$lng&charge=$usercharge&shop=$usershop&time=$usertime&id=$userid');
      print(response);
    } catch (e) {
      print(e);
    }
  } //apiบันทึกข้อมูลผู้ขาย
} //end
