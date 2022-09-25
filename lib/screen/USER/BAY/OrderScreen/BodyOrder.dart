import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/model/slide.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:project/winged/slideitem.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final PageController _pageController =PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return BackgroundPageBay(
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                    itemCount: slideList.length,
                    itemBuilder: (ctx, i) => SlideItem(i))),
          ],
        ),

    );
  }
}
