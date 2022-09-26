
import 'package:flutter/material.dart';

import 'body_profilebay.dart';


class ProFileUserBay extends StatefulWidget {
  const ProFileUserBay({Key? key}) : super(key: key);

  @override
  State<ProFileUserBay> createState() => _ProFileUserBayState();
}

class _ProFileUserBayState extends State<ProFileUserBay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyProFileBay());
  }
}


