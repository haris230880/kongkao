import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../../../../my_style.dart';
import '../HOME/components/home_screenbay.dart';

class BodyProFileBay extends StatefulWidget {
  const BodyProFileBay({Key? key}) : super(key: key);

  @override
  State<BodyProFileBay> createState() => _BodyProFileBayState();
}

class _BodyProFileBayState extends State<BodyProFileBay> {
  @override
  Widget build(BuildContext context) {
    return BackgroundPageBay(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            usernamestlyeprofile('userbay.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'บัญชีขอฉัน',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            Text(
              'ระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            TextButton(onPressed: () {}, child: ManuProflie('manu')),
            Text(
              'ออกจากระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            SingoutButtonProfile(context),
          ]),
        ),
      ),
    );
  }

}
