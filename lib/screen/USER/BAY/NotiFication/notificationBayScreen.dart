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
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                minRadius: 20,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/icons/userbay.png',
                  scale: 10,
                ),
              ),
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(children: [
                  TextSpan(
                    text: "K",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  TextSpan(
                    text: "ongkao ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ]),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.notification_add,color: Colors.white,),
                  ],
                ))
          ],
        ),

        body: BodyNotificaBay(),
    );
  }
}
