import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:project/winged/map.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageBay(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  // image: DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(API.BASE_URL + productModel.productphoto),
                  // ),
                ),
                child: WingetMaps(),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white54,
                    ),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back)),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white54,
                    ),
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 120,
              right: 0,
              bottom: 0,
              top: 450,
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20, top: 80),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อร้าน: ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 20,
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'ชื่อ: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ระยะทาง: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 350,
              top: 250,
              child: CircleAvatar(

                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/icons/userbay.png'),
                // child: Image.asset(
                //   'assets/icons/userbay.png',
                //   scale: 1,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
