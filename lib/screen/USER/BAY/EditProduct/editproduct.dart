import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';

import '../../../../configs/String.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class EditProduct extends StatefulWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  String dropdownValue = list.first;
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
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: kPrimaryColor,
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/images/no_photo.png'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              // Foreground color
                              onPrimary: Colors.white,
                              // Background color
                              primary: kPrimaryColor,
                              minimumSize: Size(100, 50))
                          .copyWith(
                              elevation: ButtonStyleButton.allOrNull(5.0)),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Icon(Icons.camera),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'เพิ่มรูป',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
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
                            Text(
                              'เปลี่ยนรูป',
                              style: TextStyle(
                                  color: kPrimaryblckColor, fontSize: 14),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    nameFrom('สินค้า'),
                    SizedBox(
                      height: 20,
                    ),
                    prictFrom('ราคา'),
                    DropdownButton(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: TextStyle(color: kPrimaryblckColor),
                      underline: Container(
                        height: 3,
                        color: kPrimaryColor,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          )),
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
        // onChanged: (value) =>buyuser_name = value.trim(),
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
        // onChanged: (value) =>buyuser_name = value.trim(),
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
}
