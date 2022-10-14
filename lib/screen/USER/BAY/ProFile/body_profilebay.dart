import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
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
  // UserBayModel?  userBayModel;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  // }
  // Future<Null>readDataUser()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? id = preferences.getString('buyuser_id');
  //   String? buyuser_id ;
  //
  //
  //   String url = API.BASE_URL+'/flutterApiProjeck/getUserWhereIDBay.php?isAdd=true&buyuser_id=$buyuser_id';
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // MyStyle().usernamestlyeprofile('$userphoto'),
            Row(
              children: [
                Container(
                  child: Column(children: [
                    CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        maxRadius: 50,
                        child: userphoto == null
                            ? Image.asset('assets/icons/userbay.png')
                            : CircleAvatar(
                                maxRadius: 50,
                                backgroundImage:
                                    NetworkImage(API.BASE_URL + '$userphoto'))),
                  ]),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          '$usershop',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        // Text(
                        //   '$userlastname',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 30),
                        // ),
                        OutlinedButton(
                          onPressed: () {
                            
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditProduct(),));
                          },
                          child: Row(
                            children: [

                              Text(
                                'เเก้ไขข้อมูล  ',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue),
                              ),
                              Icon(Icons.edit,size: 15),
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
              'บัญชีขอฉัน',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            TextButton(
                onPressed:() => Edit(context, 'เเก้ไข', 'sad'),
                child: MyStyle().ManuProflie('ชื่อ: $username')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('นามสกุล: $userlastname')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('เบอร์โทรศัพท์: $userphone')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('อีเมล: $useremail')),
            SizedBox(
              height: 20,
            ),
            Text(
              'ระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('ร้านค้า: $usershop')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('ค่าบริการ: $usercharge')),
            TextButton(
                onPressed: () {},
                child: MyStyle().ManuProflie('เวลาทำการ: $usertime')),
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
