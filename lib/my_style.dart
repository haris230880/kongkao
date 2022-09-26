import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HOME/components/home_screenbay.dart';

import 'constants.dart';
import 'future_All.dart';

Row usernamestlyeprofile(String namePic) {
  return Row(
    children: [
      Container(
        child: Column(children: [
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            maxRadius: 50,
            child: Image.asset('assets/icons/$namePic'),
          ),
        ]),
      ),
      SizedBox(
        width: 20,
      ),
      userprofilename('$userid'),
    ],
  );
}

Container userprofilename(String usrename) {
  return Container(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'USERNAME: $usrename',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'เเก้ไขข้อมูล  >',
            style: TextStyle(fontSize: 16),
          ),
        ]),
  );
}

TextButton SingoutButtonProfile(BuildContext context) {
  return TextButton(
      onPressed:() =>
          signOutprocess(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('ผู้ใช้: $userphone',
            style: TextStyle(color: kPrimaryblckColor),
          ),
          Text('ออกจากระบบ', style: TextStyle(color: kPrimaryblckColor))
        ],
      ));
}


Row ManuProflie(String NamuProflie) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '$NamuProflie',
        style: TextStyle(color: kPrimaryblckColor),
      ),
      Text('>', style: TextStyle(color: kPrimaryblckColor))
    ],
  );
}
