
import 'package:flutter/material.dart';

import 'body_profilebay.dart';


class ProFileUserBaySreen extends StatefulWidget {
  const ProFileUserBaySreen({Key? key}) : super(key: key);

  @override
  State<ProFileUserBaySreen> createState() => _ProFileUserBaySreenState();
}

class _ProFileUserBaySreenState extends State<ProFileUserBaySreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyProFileBay());
  }
}


