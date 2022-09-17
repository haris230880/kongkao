import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/HOME/components/backgroundhomebay.dart';
class BodyProFileBay extends StatefulWidget {
  const BodyProFileBay({Key? key}) : super(key: key);

  @override
  State<BodyProFileBay> createState() => _BodyProFileBayState();
}

class _BodyProFileBayState extends State<BodyProFileBay> {
  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(child: SafeArea(child: Column()));
  }
}
