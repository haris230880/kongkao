import 'package:flutter/material.dart';
import 'package:project/winged/slide.dart';
import 'package:project/screen/USER/BAY/OrderScreen/Order.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:project/winged/slideitem.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset('assets/images/no_photo.png'),
            Text('ไม่มีอะไรเลยย', style: TextStyle(fontSize: 30)),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Order();
                    },
                  ),
                );
              },
              child: Text('Order'),
            )
          ],
        ),
      ),
      // child: Column(
      //   children: [
      //     Expanded(
      //         child: PageView.builder(
      //           scrollDirection: Axis.horizontal,
      //           controller: _pageController,
      //             itemCount: slideList.length,
      //             itemBuilder: (ctx, i) => SlideItem(i))),
      //   ],
      // ),
    );
  }
}
