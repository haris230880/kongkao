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
    return BackgroundPageBay(
      child: SingleChildScrollView(
        child: Column(
            children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),),),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('data'),
              Text('data'),
              Text('data'),
            ],
          ),
        ),

    ]),
      ),
    
    );
  }
}
