import 'package:flutter/material.dart';


class BackgroundHomePageBay extends StatelessWidget {
  final Widget child;
  const BackgroundHomePageBay({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: Colors.lightGreen.shade50,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[


          child,
        ],
      ),
    );
  }
}
