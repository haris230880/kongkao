import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/screen/Regis/components/bobyaddress/boby_register_address_bay.dart';
import 'package:project/screen/Regis/components/bodyregisnumber/body_regis_number_bay.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_bay.dart';
import 'package:project/screen/USER/BAY/HOME/components/home_screenbay.dart';

import 'constants.dart';
import 'future_All.dart';

class MyStyle {


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
        onPressed: () =>
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

Widget showProgress(){
    return Center(
      child:  CircularProgressIndicator(backgroundColor: kPrimaryLightColor)
    );
}

  CircleAvatar CircleAvataruserbuy() {
    return CircleAvatar(
        backgroundColor: kPrimaryColor,
        maxRadius: 80,
        child: fileuser == null
            ? Image.asset('assets/icons/userbay.png')
            : CircleAvatar(
          maxRadius: 80,
          backgroundImage: FileImage(fileuser!),
        ));
  }

  CircleAvatar CircleAvatarusersale() {
    return CircleAvatar(
        backgroundColor: kPrimaryColor,
        maxRadius: 80,
        child: fileuser == null
            ? Image.asset('assets/icons/usersale.png')
            : CircleAvatar(
          maxRadius: 80,
          backgroundImage: FileImage(fileuser!),
        ));
  }
  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId('myShop'),
        position: LatLng(lat!, lng!),
        infoWindow:
        InfoWindow(title: 'ที่อยู่', snippet: 'ละติจุด$lat ,ลองติจูด$lng'),
      ),
    ].toSet();
  }
  Container showmap() {
    LatLng latLng = LatLng(lat!, lng!);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 18);
    return Container(
      height: 300,
      width: 300,
      color: kPrimaryblckColor,
      child: lat == null ? MyStyle().showProgress() :
      GoogleMap(
        myLocationEnabled: true,
        markers: myMarker(),
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }
}//end