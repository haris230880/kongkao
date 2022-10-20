import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/configs/datauserbay.dart';
import 'package:project/constants.dart';
import 'package:project/future_All.dart';
import 'package:project/model/producttypemodel.dart';
import 'package:project/screen/Login/components/bodylogin.dart';
import 'package:project/screen/USER/BAY/HOME/components/home_screenbay.dart';
import 'package:project/screen/USER/BAY/HomePageBay.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:project/screen/USER/BAY/oeder_list_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../configs/services/api.dart';
import '../../../../model/productmodel.dart';

const List<String> list = <String>['1', '2', '3', '4', '5'];

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}


class NewObject{
final  String title;
 final String txt;

NewObject(this.title,this.txt);

}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  String? product_price, product_photo, product_name;
  File? file;
  String? protype_id;

  List<TypeProductModel> typeProducts = [];
  List dataproduct = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      finduser();
      readTypeProduct();
    });
  }

  Future<Null> readTypeProduct() async {
    String url = API.BASE_URL + '/kongkao/showtypeproduct.php?isAdd=true';

    Response response = await Dio().get(url);
    //print('response$response');
    var result = jsonDecode(response.data); //ดึงข้อมูลมา
    // print("result>>>>$result");
    if (result.toString() != 'null') {
      // print("have");
      for (var map in result) {
        TypeProductModel typeProductModel = TypeProductModel.fromJson(map);
        setState(() {
          typeProducts.add(typeProductModel);
          dataproduct = result;
        });
        print(dataproduct);
      }
    } else {
      normaDiolog(context, 'Error');
      print("nohave");
    }
  }

  static final List<NewObject> items = <NewObject>[
    NewObject('1','เเก้ว'),
    NewObject('2','พลาสติก'),
    NewObject('3','กระดาษ'),
    NewObject('4','อลูมิเนียม'),
    NewObject('5','อิเล็กทรอนิกส์'),
    NewObject('6','อื่นๆ'),

  ];

  NewObject protype_id2 = items.first;

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('AddProduct'),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 400,
                      height: 200,
                      child: file == null
                          ? Image.asset('assets/images/no_photo.png')
                          : Container(
                              height: 400,
                              width: 400,
                              child: Image.file(file!))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () =>
                              chooseImage(ImageSource.camera), //เพิ่มรูป
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                color: kPrimaryblckColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              // Text(
                              //   'เพิ่มรูป',
                              //   style: TextStyle(
                              //       color: kPrimaryblckColor, fontSize: 14),
                              // ),
                            ],
                          )),
                      Text('||'),
                      TextButton(
                          onPressed: () =>
                              chooseImage(ImageSource.gallery), //เพิ่มรูป
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_size_select_actual,
                                color: kPrimaryblckColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              // Text(
                              //   'เพิ่มรูป',
                              //   style: TextStyle(
                              //       color: kPrimaryblckColor, fontSize: 14),
                              // ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  nameFrom('สินค้า'),
                  SizedBox(
                    height: 20,
                  ),
                  prictFrom('ราคา'),
                  SizedBox(
                    height: 20,
                  ),
                   // dropdown2(),

                  dropdown(),
                  // Center(child: dropdown()),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          final isValidFrom = formKey.currentState!.validate();
                          if (isValidFrom) {
                            if (protype_id != null) {
                              if (file != null) {
                                uplodeimageandsave();
                                Navigator.pop(context);
                              } else {
                                normaDiolog(context, 'เลือกรูป');
                              }
                            } else {
                              normaDiolog(context, 'เลือกประเภท');
                            }
                          } else {
                            normaDiolog(context, 'กรอกข้อมูลให้ครบ');
                          }
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
                      SizedBox(
                        width: 50,
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
                          Navigator.pop(context);
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container dropdown2() {
    return Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(horizontal:20, vertical: 2),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: Colors.black12
                      ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<NewObject>(
                      value: protype_id2,
                      items: items
                          .map((item) => DropdownMenuItem<NewObject>(
                                child: Row(
                                  children: [
                                    Text(item.txt),
                        SizedBox(width: 10,),
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                value: item,
                              ))
                          .toList(),
                      onChanged: ( value) => setState(() {
                         protype_id2 = value!;
                         print('protype_id2>>>>$protype_id2');
                      }),
                    ),
                  ),
                );
  }

  Widget nameFrom(
    String namefile,
  ) {
    return Container(
      height: 50,
      width: 350,
      child: TextFormField(
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "กรอก $namefile";
          }
          return null;
        },
        onChanged: (value) => product_name = value.trim(),
        keyboardType: TextInputType.text,
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
            '$namefile',
            style: TextStyle(color: kPrimaryblckColor),
          ),
        ),
      ),
    );
  }

  Widget prictFrom(
    String prictfile,
  ) {
    return Container(
      height: 50,
      width: 350,
      child: TextFormField(
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "กรอก $prictfile";
          }
          return null;
        },
        onChanged: (value) => product_price = value.trim(),
        keyboardType: TextInputType.number,
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
            '$prictfile',
            style: TextStyle(color: kPrimaryblckColor),
          ),
        ),
      ),
    );
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

  Widget dropdown() {
    return Container(
      width: 300,
      child: DropdownButtonFormField(
        hint: Text('เลือกประเภท'),
        icon: Padding(
          //Icon at tail, arrow bottom is default icon
          padding: EdgeInsets.only(left: 100),
          child: Icon(
            Icons.arrow_drop_down_circle,
            color: kPrimaryColor,
          ),
        ),
        value: protype_id,
        elevation: 5,
        style: TextStyle(color: kPrimaryblckColor),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            protype_id = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          );
        }).toList(),
      ),
    );
  }

  Future<Null> uplodeimageandsave() async {
    Random random = Random();

    int i = random.nextInt(100000);
    String nameimage = 'shop$i.jpg';
    String url = API.BASE_URL + '/kongkao/saveimageproduct.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameimage);
      FormData formData = FormData.fromMap(map);
      await Dio().post(url, data: formData).then((value) {
        print('$value');

        product_photo = '/kongkao/imageproduct/$nameimage';
        print('$product_photo');
        getHttpProduct();
      });
    } catch (e) {}
  }

  void getHttpProduct() async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/insertproduct.php?isAdd=true&productid=NULL&productname=$product_name&productprice=$product_price&idtypeproduct=$protype_id&id=$userid&productphoto=$product_photo');
      print(response);
    } catch (e) {
      print(e);
    }
  }
} //end
