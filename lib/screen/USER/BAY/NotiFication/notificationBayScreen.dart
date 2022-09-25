import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/NotiFication/bodynotifibay.dart';

class NotiFicationBayScreen extends StatefulWidget {
  const NotiFicationBayScreen({Key? key}) : super(key: key);

  @override
  State<NotiFicationBayScreen> createState() => _NotiFicationBayScreenState();
}

class _NotiFicationBayScreenState extends State<NotiFicationBayScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

        title: Center(child: Text('การเเจ้งเตือน',style: TextStyle(color: kPrimaryblckColor),),),
      ),
        body: BodyNotificaBay(),
    );
  }
}
