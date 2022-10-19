
import 'package:flutter/material.dart';

class Slide{
  late final String derciption;


  Slide({
    required this.derciption
});
}

final slideList=[
  Slide(derciption: 'คำสั้งซื้อ'),
  Slide(derciption: 'ดำเนินการ'),
  Slide(derciption: 'เสร็จสสิ้น'),
  Slide(derciption: 'ยกเลิก'),
];


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