import 'package:flutter/material.dart';
import 'package:project/winged/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Text(slideList[index].derciption),
            ],
          ),
        ),
      ],
    );
  }
}
