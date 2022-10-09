import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/model/user_bay_model.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                MyStyle(). usernamestlyeprofile('userbay.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'บัญชีขอฉัน',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            TextButton(onPressed: () {}, child:  MyStyle(). ManuProflie('manu')),
            TextButton(onPressed: () {}, child:   MyStyle().ManuProflie('manu')),
            TextButton(onPressed: () {}, child:  MyStyle(). ManuProflie('manu')),
            TextButton(onPressed: () {}, child:   MyStyle().ManuProflie('manu')),
            Text(
              'ระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            TextButton(onPressed: () {}, child:   MyStyle().ManuProflie('manu')),
            TextButton(onPressed: () {}, child:   MyStyle().ManuProflie('manu')),
            TextButton(onPressed: () {}, child:   MyStyle().ManuProflie('manu')),
            TextButton(onPressed: () {}, child:  MyStyle(). ManuProflie('manu')),
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
