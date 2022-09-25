import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';

import '../../../../configs/String.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return BackgroundPageBay(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text('EditProduct'),
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Center(
                    child: Container(
                      color: kPrimaryColor,
                      width: 200,
                      height: 200,
                    ),

                  ),
                  Container(
                    height: 50,
                    width: 250,
                    child:  TextFormField(
                      validator: (value) {
                        if (value != null && value.length < 10) {
                          return "กรอก หมายเลขโทรศัพท 10 ตัว";
                        }
                        return null;
                      },
                      onChanged: (value) => phone_number = value.trim(),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      keyboardType: TextInputType.phone,
                      cursorColor: kPrimaryColor,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            'หมายเลขโทรศัพท ์',
                            style: TextStyle(
                                color: kPrimaryblckColor, fontSize: 14),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            size: 20,
                            color: kPrimaryColor,
                          )),
                    ),
                  ),

                ],

              ),
            ),
          )),
    );
  }
}
