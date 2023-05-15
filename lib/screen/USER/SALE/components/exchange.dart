import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import 'package:project/configs/services/api.dart';
import 'package:project/constants.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/BAY/OrderScreen/OrderSreen.dart';
import 'package:project/screen/USER/BAY/ProFile/editprofile.dart';
import 'package:project/screen/USER/BAY/Product/editproduct.dart';
import 'package:project/screen/USER/SALE/Home/components/home_screensale.dart';
import 'package:project/screen/USER/SALE/HomePageSell.dart';
import 'package:project/screen/USER/SALE/ProFile/editprofile.dart';
import 'package:project/screen/USER/SALE/components/showlist.dart';
import 'package:toast/toast.dart';

import '../../../../future_All.dart';
import '../../../../model/usermodel.dart';

class Exchange extends StatefulWidget {
  final UserModel userModel;

  const Exchange({Key? key, required this.userModel}) : super(key: key);

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  UserModel? userModeluser; //ของsale
  late UserModel userModel; //รับค่า
  File? file;
  double? lat1, lng1, lat2, lng2, distincd;
  String? distincdString,	exphoto;
  CameraPosition? position;

  String? iduserbuy,	idusersale , chargesum;




  int? transport,sum;


  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  List<String> selectedValues = [];

// Location location = Location();//อัพตลอด

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel; //รับค่า
    findLat1Lng1();
    readDatausersale();
    iduserbuy=userModel.id;
    idusersale=userid;
    print('iduserbuy=$iduserbuy');
    print('idusersale=$idusersale');

    chargesum =userModel.charge ;


//
// location.onLocationChanged.listen((event) {
//   setState(() {
//
//     lat1 =event.latitude;
//     lng1 =event.longitude;
//   });
//
//   print('object$lat1,$lat2');
// });//อัพตลอด
//
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    try {
      var object = await ImagePicker.platform.pickImage(
        source: imageSource,
        maxHeight: 800.0,
        maxWidth: 800.0,
      );
      setState(() {
        print(file);
        file = File(object!.path);
      });
    } catch (e) {}
  }

  Future<Null> uplodeimageandsave() async {
    Random random = Random();

    int i = random.nextInt(100000);
    String nameimage = 'exphoto$i.jpg';
    String url = API.BASE_URL + '/kongkao/saveimageorder.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameimage);
      FormData formData = FormData.fromMap(map);
      await Dio().post(url, data: formData).then((value) {
        print('$value');
        exphoto = '/kongkao/imageorder/$nameimage';
        print('$exphoto');
        getHttpProductorder();

      });
    } catch (e) {}
  }



  //เพิ่มตัวเเปร id สินค้า รับเป็น arr [1,3]

  void getHttpProductorder() async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/insertorder.php?isAdd=true&iduserbuy=$iduserbuy&idusersale=$idusersale&exphoto=$exphoto&distance=$distincd&transport=$transport&total=$sum&detail=$selectedValues&status=null');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }





  Future<Null> readDatausersale() async {
    String url = API.BASE_URL + '/kongkao/showuser.php?isAdd=true&id=$userid';
    await Dio().get(url).then(
      (value) {
        var result = json.decode(value.data);
        print('result>>>>>>>>>>>>>>>>$result');
        for (var map in result) {
          setState(() {
            userModeluser = UserModel.fromJson(map);
          });
        }
      },
    );
  }

  Future<LocationData?> findLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {}
    return null;
  }

  Future<Null> findLat1Lng1() async {
    LocationData? locationData = await findLocation();
    setState(() {
      lat1 = locationData!.latitude;
      lng1 = locationData!.longitude;

      lat2 = double.parse(userModel.latitude);
      lng2 = double.parse(userModel.longitude);

      print('lat1&lng1: $lat1,$lng1');
      print('lat2&lng2: $lat2,$lng2');

      distincd = calculateDistance(lat1!, lng1!, lat2!, lng2!);
      var myformat = NumberFormat('#0.0#', 'en_US'); //กำหนดกิโล
      distincdString = myformat.format(distincd);
      print('distincd = $distincd');
      transport = calcutateTansport(distincd!);
      int? change =  int.parse(userModel.charge);
      sum = (transport! + change)!;
      print('sum= $sum');
      print('transport = $transport');



    });
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    double distance = 0;

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
    distance = 12742 * asin(sqrt(a));

    return distance;
  } //คำนวนระยะห่าง

  int? calcutateTansport(double distincd) {
    int transport;
    if (distincd < 5.0) {
      transport = 5; //
      return transport;
    } else {
      transport = 5 + (distincd - 5).round() * 10; //เกิน0.5ปัดขึ้น
      return transport;
    }
  } //คำนวนราคาค่าส่ง


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('รายการขาย'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ที่อยู่จัดส่ง',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  userModeluser == null
                      ? MyStyle().showProgress()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfilesale(),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          size: 15, color: Colors.redAccent),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'ที่อยู่จัดส่ง',
                                        style: txtboldsize16colorback(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${userModeluser!.name} ${userModeluser!.lastname}',
                                        style: txtboldcolorback(),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.phone,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                      Text('${userModeluser!.phone}',
                                          style: txtboldcolorback()),
                                    ],
                                  ),
                                  Text(
                                      'บ้านเลขที่${userModeluser!.housenum} ตำบล ${userModeluser!.district} อำเภอ${userModeluser!.prefecture} ',
                                      style: txtboldcolorback()),
                                  Text(
                                      'จังหวัด ${userModeluser!.city} รหัสไปรษณีย์ ${userModeluser!.postid}',
                                      style: txtboldcolorback()),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ร้าน ${userModel.shop}',
                            style: txtboldsize16colorback(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ระยะทาง'),
                              Text(distincd == null
                                  ? ''
                                  : '$distincdString กิโลเมตร'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ค่าส่ง'),
                              Text(transport == null ? '' : '$transport บาท'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ค่าบริการ'),
                              Text(userModel.charge == null
                                  ? ''
                                  : '${userModel.charge} บาท'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('รวม'),
                              Text('$sum'),
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  activeColor: kPrimaryColor,
                  title: Text('เเก้ว'),
                  value: selectedValues.contains('เเก้ว'),
                  onChanged: (value) {
                    setState(() {
                      if (value==true) {
                        selectedValues.add('เเก้ว');
                        print(selectedValues);
                      } else {
                        selectedValues.remove('เเก้ว');
                        print(selectedValues);
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: kPrimaryColor,
                  title: Text('พลาสติก'),
                  value: selectedValues.contains('พลาสติก'),
                  onChanged: (value) {
                    setState(() {
                      if (value==true) {
                        selectedValues.add('พลาสติก');
                        print(selectedValues);
                      } else {
                        selectedValues.remove('พลาสติก');
                        print(selectedValues);
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: kPrimaryColor,
                  title: Text('กระดาษ'),
                  value: selectedValues.contains('กระดาษ'),
                  onChanged: (value) {
                    setState(() {
                      if (value==true) {
                        selectedValues.add('กระดาษ');
                        print(selectedValues);
                      } else {
                        selectedValues.remove('กระดาษ');
                        print(selectedValues);
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: kPrimaryColor,
                  title: Text('อลูมิเนียม'),
                  value: selectedValues.contains('อลูมิเนียม'),
                  onChanged: (value) {
                    setState(() {
                      if (value==true) {
                        selectedValues.add('อลูมิเนียม');
                        print(selectedValues);
                      } else {
                        selectedValues.remove('อลูมิเนียม');
                        print(selectedValues);
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: kPrimaryColor,
                  title: Text('อิเล็กทรอนิกส์'),
                  value: selectedValues.contains('อิเล็กทรอนิกส์'),
                  onChanged: (value) {
                    setState(() {
                      if (value==true) {
                        selectedValues.add('อิเล็กทรอนิกส์');
                        print(selectedValues);
                      } else {
                        selectedValues.remove('อิเล็กทรอนิกส์');
                        print(selectedValues);
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: kPrimaryColor,
                  title: Text('อื่นๆ'),
                  value: selectedValues.contains('อื่นๆ'),
                  onChanged: (value) {
                    setState(() {
                      if (value==true) {
                        selectedValues.add('อื่นๆ');
                        print(selectedValues);
                      } else {
                        selectedValues.remove('อื่นๆ');
                        print(selectedValues);
                      }
                    });
                  },
                ),


            Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(),
                      child: file == null
                          ? Image(image: AssetImage('assets/images/box.png'))
                          : Image(image: FileImage(file!)),
                    ),
                    ElevatedButton(
                        onPressed: () => chooseImage(ImageSource.camera),
                        child: Text('เพิ่มรูป')),
                  ],
                ),
              ),
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
                    onPrimary: Colors.white,
                    primary: kPrimaryColor,
                    minimumSize: Size(100, 40),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
                  onPressed: () {
                    uplodeimageandsave();
                    print('object');
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageSell()),
                          (route) => route.isFirst,
                    );
                  },
                  child: Text('ยืนยัน'),
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
                          primary: Colors.redAccent,
                          minimumSize: Size(100, 40))
                      .copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ยกเลิก'),
                ),
              ],
            ),


            // showmap()
          ]),
        ),
      ),
    );
  }

  TextStyle txtboldsize16colorback() {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black);
  }

  TextStyle txtboldcolorback() {
    return TextStyle(color: Colors.black);
  }

  Container showmap() {
    if (lat1 != null) {
      LatLng latLng1 = LatLng(lat1!, lng1!);
      position = CameraPosition(target: latLng1, zoom: 16);
    }

    Marker usermarker() {
      return Marker(
        markerId: MarkerId('usermarker'),
        position: LatLng(lat1!, lng1!),
        icon: BitmapDescriptor.defaultMarkerWithHue(60),
        infoWindow: InfoWindow(title: 'คุณอยู่ที่นี่'),
      );
    }

    Marker shopmarker() {
      return Marker(
        markerId: MarkerId('shopmarker'),
        position: LatLng(lat2!, lng2!),
        icon: BitmapDescriptor.defaultMarkerWithHue(150),
        infoWindow: InfoWindow(title: '${userModel.shop}'),
      );
    }

    Set<Marker> myset() {
      return <Marker>[usermarker(), shopmarker()].toSet();
    }

    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: lat1 == null
          ? MyStyle().showProgress()
          : GoogleMap(
              initialCameraPosition: position!,
              mapType: MapType.normal,
              onMapCreated: (controller) {},
              markers: myset(),
            ),
    );
  }




}//end

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(
              children: [
                Text(label),
              ],
            )),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
              activeColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
