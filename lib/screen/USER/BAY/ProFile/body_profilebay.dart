import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/screen/USER/BAY/ProFile/editprofile.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../../../../my_style.dart';
import '../HOME/components/home_screenbay.dart';
import '../HomePageBay.dart';





class BodyProFileBay extends StatefulWidget {
  const BodyProFileBay({Key? key}) : super(key: key);

  @override
  State<BodyProFileBay> createState() => _BodyProFileBayState();
}




class _BodyProFileBayState extends State<BodyProFileBay> {
  UserModel? userModel ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDatauser();
  }


  Future<Null> readDatauser() async {
    String url = API.BASE_URL + '/kongkao/showuser.php?isAdd=true&id=$userid';
    await Dio().get(url).then(
          (value) {
        var result = json.decode(value.data);
        print('$result');
        for(var map in result){
          setState(() {
            userModel = UserModel.fromJson(map);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: SingleChildScrollView(
        child: userModel==null ?MyStyle().showProgress()  :Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Container(
                  child: Column(children: [
                    CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        maxRadius: 50,
                        child: userModel!.photo == null
                            ? Image.asset('assets/icons/userbay.png')
                            : CircleAvatar(
                                maxRadius: 50,
                                backgroundImage:
                                    NetworkImage(API.BASE_URL + '${userModel!.photo}'))),
                  ]),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${userModel!.shop}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),

                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfileBuy(),
                                )).then((value) => readDatauser());//กลับมาบลละรีข้อมูล
                          },
                          child: Row(
                            children: [
                              Text(
                                'เเก้ไขข้อมูล  ',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                              Icon(Icons.edit, size: 15),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'บัญชีของฉัน',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
                TextButton(
                    onPressed: () {},
                    child: MyStyle().ManuProflie('ชื่อ: ${userModel!.name}')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('นามสกุล: ${userModel!.lastname}')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('เบอร์โทรศัพท์: ${userModel!.phone}')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('อีเมล: ${userModel!.email}')),
            SizedBox(
              height: 20,
            ),
            Text(
              'ระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('ร้านค้า: ${userModel!.shop}')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('ค่าบริการ: ${userModel!.charge}')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('เวลาทำการ:${userModel!.time}')),
            SizedBox(
              height: 20,
            ),
            Text(
              'ออกจากระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            MyStyle().SingoutButtonProfile(context),
          ]),
        ),
      ),
    );
  }

}
