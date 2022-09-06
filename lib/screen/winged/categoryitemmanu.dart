import 'package:flutter/material.dart';

import '../../constants.dart';



class CategoryItemManu extends StatelessWidget {
  final String titie;
  final Function press;
  final bool isActive;
  const CategoryItemManu({
    Key? key,
    required this.titie,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              titie,
              style: isActive
                  ? TextStyle(fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 13),
            ),
            if (isActive)
              Container(
                margin: EdgeInsets.all(3),
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
          ],
        ),
      ),
    );
  }
}