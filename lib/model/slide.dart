import 'package:flutter/cupertino.dart';

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