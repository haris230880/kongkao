import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
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
            top: -40,
            left: -70,
            child: Image.asset(
              "assets/icons/backgrad (2).png",
              width: size.width*0.5,
                // color: const Color.fromRGBO(255, 255, 255, 0.7),
                // colorBlendMode: BlendMode.modulate

            ),
          ),
          Positioned(
            top: -70,
            left: 270,
            child: Image.asset(
              "assets/icons/backgrad (1).png",
              width: size.width*0.5,
            ),
          ),
          Positioned(
            bottom: -370,
            left: -10,
            child: Image.asset(
              "assets/icons/backgrad (3).png",
              width: size.width*2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
