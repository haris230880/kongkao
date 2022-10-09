import 'package:flutter/material.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';

class BodyNotificaBay extends StatefulWidget {
  const BodyNotificaBay({Key? key}) : super(key: key);

  @override
  State<BodyNotificaBay> createState() => _BodyNotificaBayState();
}

class _BodyNotificaBayState extends State<BodyNotificaBay> {
  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
