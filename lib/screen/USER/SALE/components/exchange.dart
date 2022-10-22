import 'package:flutter/material.dart';
import 'package:project/constants.dart';

import '../../../../model/usermodel.dart';

class Exchange extends StatefulWidget {
  final UserModel userModel;

  const Exchange({Key? key, required this.userModel}) : super(key: key);

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  late UserModel userModel; //รับค่า

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel; //รับค่า
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('คำสั่งซื้อ: ร้าน${userModel.shop}'),
      ),
      body: Column(children: [
        Text('${userModel.name}'),
      ]),
    );
  }

}
