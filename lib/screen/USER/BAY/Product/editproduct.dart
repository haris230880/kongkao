import 'dart:convert';

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constants.dart';
import 'package:project/model/producttypemodel.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:project/screen/USER/BAY/oeder_list_shop.dart';

import '../../../../configs/services/api.dart';
import '../../../../future_All.dart';
import '../../../../model/productmodel.dart';
import '../HomePageBay.dart';
import 'addproduct.dart';

class Editproduct extends StatefulWidget {
  final ProductModel productModel;

  const Editproduct({Key? key, required this.productModel}) : super(key: key);

  @override
  State<Editproduct> createState() => _EditproductState();
}

// List<String> list = <String>[
//   // 'พลาสติก',
//   // 'กระดาษ',
//   // 'อลูมิเนียม',
//   // 'แก้ว',
//   // 'อื่น ๆ'
//   '1',
//   '2',
//   '3',
//   '4',
//   '5'
// ];

class _EditproductState extends State<Editproduct> {
  late ProductModel productModel;
  late TypeProductModel typeProductModel;

  final formKey = GlobalKey<FormState>();
  String? product_price, product_photo, product_name, product_id;
  File? file;
  String? protype_id, selectvalue;

  List<TypeProductModel> typeProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    productModel = widget.productModel;
    product_photo = productModel.productphoto;
    product_price = productModel.productprice;
    product_name = productModel.productname;
    product_id = productModel.productid;
    protype_id = productModel.typeproductname;

    readTypeProduct();

    print('selectvalue???$selectvalue');
  }

  Future<Null> readTypeProduct() async {
    String url = API.BASE_URL + '/kongkao/showtypeproduct.php?isAdd=true';

    Response response = await Dio().get(url);
    //print('response$response');
    var result = jsonDecode(response.data); //ดึงข้อมูลมา
    print("result>>>>$result");
    if (result.toString() != 'null') {
      // print("have");
      for (var map in result) {
        TypeProductModel typeProductModel = TypeProductModel.fromJson(map);
        setState(() {
          typeProducts.add(typeProductModel);
        });
      }
    } else {
      normaDiolog(context, 'Error');
      print("nohave");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => confirmDialog(), icon: Icon(Icons.delete))
          ],
          backgroundColor: kPrimaryColor,
          title: Text('EditProduct'),
        ),
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: file == null
                          ? Container(
                              padding:
                                  EdgeInsetsDirectional.all(kDefaultPaddin),
                              height: 150,
                              width: fixsixe.listViewImgSize200,
                              decoration: BoxDecoration(
                                  color: kPrimaryblckColor,
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(API.BASE_URL +
                                          "${productModel.productphoto}"))),
                            )
                          : Container(
                              padding:
                                  EdgeInsetsDirectional.all(kDefaultPaddin),
                              height: 150,
                              width: fixsixe.listViewImgSize200,
                              decoration: BoxDecoration(
                                color: kPrimaryblckColor,
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(file!),
                                ),
                              ),
                            )),
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dropdown(),
                    ],
                  ),
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
                            uplodeimageandsave();
                            getHttpProduct();
                            Navigator.pop(context);
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderListShop(),
                              ));
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
        initialValue: product_name,
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
        initialValue: product_price,
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

  Widget dropdown() {
    return Container(
      width: 300,
      child: DropdownButtonFormField(
        hint: Text('${protype_id}'),
        icon: Padding(
          //Icon at tail, arrow bottom is default icon
          padding: EdgeInsets.only(left: 100),
          child: Icon(
            Icons.arrow_drop_down_circle,
            color: kPrimaryColor,
          ),
        ),
        value: selectvalue,
        elevation: 5,
        style: TextStyle(color: kPrimaryblckColor),
        items: typeProducts.map((TypeProductModel model) {
          return DropdownMenuItem(
            value: model.idtypeproduct,
            child: Text(
              model.typeproductname,
              style: TextStyle(fontSize: 16),
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            protype_id = value!;
          });
        },
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
          '/kongkao/updateproduct.php?isAdd=true&productname=$product_name&productprice=$product_price&productphoto=$product_photo&idtypeproduct=$protype_id&id=$userid&productid=$product_id');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<Null> deleteProduct() async {
    String url = API.BASE_URL +
        '/kongkao/deleteproduct%20.php?isAdd=true&productid=$product_id';

    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/deleteproduct%20.php?isAdd=true&productid=$product_id');
    } catch (e) {
      print(e);
    }
  }

  Future<Null> confirmDialog() async {
    showDialog<void>(
      context: context,
      // barrierDismissible: barrierDismissible,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('ยืนยัน'),
          content: Text('ต้องการที่จะลบข้อมูลใช่หรือไม่ ?'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          minimumSize: Size(50, 40))
                      .copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
                  onPressed: () {
                    deleteProduct();
                    Navigator.pop(context);
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
                          minimumSize: Size(50, 40))
                      .copyWith(elevation: ButtonStyleButton.allOrNull(2.0)),
                  onPressed: () {
                    Navigator.pop(context); // Dismiss alert dialog
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
        );
      },
    );
  }
}
