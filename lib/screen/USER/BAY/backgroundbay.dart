import 'package:flutter/material.dart';

import '../../../constants.dart';


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
      color: Colors.white60,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 50,
            left: -70,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                "assets/icons/backgrad (5).png",
                width: size.width*0.5,
                // color: const Color.fromRGBO(255, 255, 255, 200),
                // colorBlendMode: BlendMode.modulate

              ),
            ),
          ),
          Positioned(
            top: -70,
            left: 270,
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/icons/backgrad (3).png",
                width: size.width*0.5,
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}
