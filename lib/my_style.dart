import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/screen/Regis/components/bobyaddress/boby_register_address_bay.dart';
import 'package:project/screen/Regis/components/bodyregisnumber/body_regis_number_bay.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_bay.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_sell.dart';
import 'package:project/screen/USER/BAY/HOME/components/home_screenbay.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/BAY/ProFile/editprofile.dart';

import 'configs/services/api.dart';
import 'constants.dart';
import 'future_All.dart';

class MyStyle {


  // Row usernamestlyeprofile(String namePic) {
  //   return Row(
  //     children: [
  //       Container(
  //         child: Column(children: [
  //           CircleAvatar(
  //             backgroundColor: kPrimaryColor,
  //             maxRadius: 50,
  //             child:namePic==null ?Image.asset('assets/icons/userbay.png')
  //                 :CircleAvatar(
  //                 maxRadius: 50,
  //                 backgroundImage: NetworkImage(API.BASE_URL+'$namePic'))
  //           ),
  //         ]),
  //       ),
  //       SizedBox(
  //         width: 20,
  //       ),
  //       userprofilename('$username $userlastname'),
  //     ],
  //   );
  // }
  //
  // Container userprofilename(String usrename) {
  //   return Container(
  //     child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             '$usrename',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.bold, fontSize: 30),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //
  //             },
  //             child: Text(
  //               'เเก้ไขข้อมูล  >',
  //               style: TextStyle(fontSize: 16,color: kPrimaryblckColor),
  //             ),
  //           ),
  //         ]),
  //   );
  // }

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
  CircleAvatar CircleAvataruseredit() {
    return CircleAvatar(
        backgroundColor: kPrimaryColor,
        maxRadius: 80,
        child: editfileuser == null
            ? CircleAvatar(
          maxRadius: 80,
          backgroundImage:
          NetworkImage(API.BASE_URL + '$userphoto'),
        )
            : CircleAvatar(
          maxRadius: 80,
          backgroundImage: FileImage(editfileuser!),
        ));
  }

  CircleAvatar CircleAvataruserbuy() {
    return CircleAvatar(
        backgroundColor: kPrimaryColor,
        maxRadius: 80,
        child: fileuserbuy == null
            ? Image.asset('assets/icons/userbay.png')
            : CircleAvatar(
          maxRadius: 80,
          backgroundImage: FileImage(fileuserbuy!),
        ));
  }

  CircleAvatar CircleAvatarusersale() {
    return CircleAvatar(
        backgroundColor: kPrimaryColor,
        maxRadius: 80,
        child: fileusersell == null
            ? Image.asset('assets/icons/usersale.png')
            : CircleAvatar(
          maxRadius: 80,
          backgroundImage: FileImage(fileusersell!),
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