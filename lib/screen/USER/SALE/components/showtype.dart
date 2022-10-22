import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/model/productmodel.dart';
import 'package:project/model/producttypemodel.dart';

import '../../../../configs/services/api.dart';
import '../../../../constants.dart';

class ShowList extends StatefulWidget {
  final TypeProductModel typeProductModel;
  const ShowList({Key? key, required this.typeProductModel}) : super(key: key);
  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {

  bool status = false;
  late TypeProductModel typeProductModel;
  List<ProductModel> productModels = [];
String? typeprodcut;

  @override
  void initState() {
    // TODO: implement setState
    super.initState();


typeProductModel = widget.typeProductModel;
print("${typeProductModel.idtypeproduct}");
    typeprodcut = typeProductModel.idtypeproduct;
    readProduct();
  }



  Future<Null> readProduct() async {
    String url = API.BASE_URL + '/kongkao/showtypewhere.php?isAdd=true&idtypeproduct=$typeprodcut';
    Response response = await Dio().get(url);
    print('response$response');
    var result = jsonDecode(response.data); //ดึงข้อมูลมา
     print("result>>>>$result");
    if (result.toString() != 'null') {
      // print("have");
      for (var map in result) {
        ProductModel productModel = ProductModel.fromJson(map);
        setState(() {
          productModels.add(productModel);

        });
      }
    } else {
      setState(() {
        status = false;
      });
      print("no");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text('${typeProductModel.typeproductname}'),
      ),
      body: SingleChildScrollView(child: showlistProduct()),
    );
  }
  Widget  showlistProduct() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productModels.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: fixsixe.listViewImgSize,
                  height: fixsixe.listViewImgSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(API.BASE_URL +
                            productModels[index].productphoto),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryLightColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            //color: Colors.lightGreen,
                            blurRadius: 1.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                        BoxShadow(color: Colors.white, offset: Offset(5, 0))
                      ]),

                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15,left: 10),
                    height: fixsixe.listViewImgSize,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              //color: Colors.lightGreen,
                              blurRadius: 1.0,
                              offset: Offset(0, 5)),
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0))
                        ]),
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${productModels[index].productname}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                  'ร้าน: ${productModels[index].shop}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                              Text(
                                  'ราคา: ${productModels[index].productprice} บาท',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                              Text(
                                  'ราคา: ${productModels[index].typeproductname} บาท',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),


                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
