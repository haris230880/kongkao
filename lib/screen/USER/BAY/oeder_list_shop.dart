import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/USER/SALE/Home/components/productdetle.dart';

class OrderListShop extends StatefulWidget {
  const OrderListShop({Key? key}) : super(key: key);

  @override
  State<OrderListShop> createState() => _OrderListShopState();
}

class _OrderListShopState extends State<OrderListShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(),));
            },
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_balance_wallet),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              'shop',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Categories(),
          ItemCard(),
          ItemCard(),
        ],
      ),
    );
  }

  Column ItemCard() {


    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsetsDirectional.all(kDefaultPaddin),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset('assets/icons/userbay.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
              child: Text('products',style: TextStyle(fontSize: 12),),
            ),
            Text("\$123",style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "พลาสติก",
    "กระดาษ",
    "อลูมิเนียม",
    "แก้ว",
    "อื่น ๆ",
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildText(index),
      ),
    );
  }

  Widget buildText(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      selectIndex == index ? kPrimaryColor : kPrimaryblckColor),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 3,
              width: 30,
              color: selectIndex == index
                  ? kPrimaryLightColor
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
