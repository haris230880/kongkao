import 'package:flutter/material.dart';


class BackgroundRegis extends StatelessWidget {
  final Widget child;
  const BackgroundRegis({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: -50,
            left: -80,
            child: Image.asset(
              "assets/icons/backgrad (3).png",
              width: size.width*0.5,
              // color: const Color.fromRGBO(255, 255, 255, 0.7),
              // colorBlendMode: BlendMode.modulate

            ),
          ),
          Positioned(
            bottom: -80,
            right: -80,
            child: Image.asset(
              "assets/icons/backgrad (1).png",
              width: size.width*0.5,
            ),
          ),
          // Positioned(
          //   bottom: -370,
          //   left: -10,
          //   child: Image.asset(
          //     "assets/icons/backgrad (3).png",
          //     width: size.width*2,
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}
