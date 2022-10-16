import 'package:flutter/material.dart';


class Editproduct extends StatefulWidget {
  const Editproduct({Key? key}) : super(key: key);

  @override
  State<Editproduct> createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }


// Future<Null> editPeodcut()async{
// SharedPreferences preferences = await SharedPreferences.getInstance();
//
// String? id = preferences.getString('PhoneNumber');
//
//     String url = API.BASE_URL+'/flutterApiProjeck/insertDataproduct.php?isAdd=true&product_name=$product_name&product_photo=$product_photo&product_price=$product_price&protype_id=$protype_id');
//
// await Dio().get(url).then((value) {
//   if(value.toString()=='true'){
//     Navigator.pop(context);
//
//   }else{
//     normaDiolog(context, 'ไม่สามารถ');
//   }
//   });
//   }
}
