import 'package:flutter/material.dart';
import 'package:project/model/exchangemodel.dart';

class DetailsScreen extends StatelessWidget {
  final ExchangeModel exchangemodel;

  DetailsScreen({required this.exchangemodel});

  @override
  Widget build(BuildContext context) {
    // Build the details screen using the exchangemodel object
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Text('Exchange ID: ${exchangemodel.exchangeid}'),
          Text('Date: ${exchangemodel.date}'),
          Text('Shop: ${exchangemodel.shop}'),
          // Add more details based on your requirements
        ],
      ),
    );
  }
}
