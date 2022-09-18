import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HOME/components/backgroundhomebay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../SALE/Home/components/body_homesale.dart';







class BodyProFileBay extends StatefulWidget {
  const BodyProFileBay({Key? key}) : super(key: key);

  @override
  State<BodyProFileBay> createState() => _BodyProFileBayState();
}

class _BodyProFileBayState extends State<BodyProFileBay> {
  //------------------
  @override
  void initState() {
    super.initState();
    finduser();
  }
  Future<Null> finduser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('phoneNumber')!;
    });
  }
  //ฟังช้่นlogout
//------------

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Container(
                  child: Column(children: [
                    CircleAvatar(
                      maxRadius: 50,
                    ),
                  ]),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'USERNAME',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          'เเก้ไขข้อมูล  >',
                          style: TextStyle(fontSize: 16),
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'data',
                      style: TextStyle(color: kPrimaryblckColor),
                    ),
                    Text('>', style: TextStyle(color: kPrimaryblckColor))
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'data',
                      style: TextStyle(color: kPrimaryblckColor),
                    ),
                    Text('>', style: TextStyle(color: kPrimaryblckColor))
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'data',
                      style: TextStyle(color: kPrimaryblckColor),
                    ),
                    Text('>', style: TextStyle(color: kPrimaryblckColor))
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'data',
                      style: TextStyle(color: kPrimaryblckColor),
                    ),
                    Text('>', style: TextStyle(color: kPrimaryblckColor))
                  ],
                )),
            Text(
              'ระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'data',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                        Text('>', style: TextStyle(color: kPrimaryblckColor))
                      ],
                    )),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'data',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                        Text('>', style: TextStyle(color: kPrimaryblckColor))
                      ],
                    )),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'data',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                        Text('>', style: TextStyle(color: kPrimaryblckColor))
                      ],
                    )),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'data',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                        Text('>', style: TextStyle(color: kPrimaryblckColor))
                      ],
                    )),
                Text(
                  'ออกจากระบบ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                TextButton(
                    onPressed:() =>
                    signOutprocess(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ผู้ใช้: $userid',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                        Text('ออกจากระบบ', style: TextStyle(color: kPrimaryblckColor))
                      ],
                    )),
          ]),
        ),
      ),
    );
  }
}
