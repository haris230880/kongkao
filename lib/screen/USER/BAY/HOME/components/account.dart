import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/model/receiptsmodel.dart';

class AccountSummaryPage extends StatelessWidget {
  final List<ReceiptsModel> receiptsModels;

  const AccountSummaryPage({Key? key, required this.receiptsModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    for (var receipt in receiptsModels) {
      totalAmount += double.parse(receipt.totalAmount!);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('บัญชี'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'รายจ่ายทั้งหมด',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: DataTable(
                    columnSpacing: 150.0,
                    horizontalMargin: 12.0,
                    columns: [
                      DataColumn(
                        label: Text('วันที่'),
                      ),
                      DataColumn(
                        label: Text('รายจ่าย'),
                      ),
                    ],
                    rows: receiptsModels.map((receipt) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                receipt.date!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          DataCell(
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('${receipt.totalAmount} บาท'),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),

                ),
              ),

              SizedBox(height: 16),
              Text(
                'รวมจ่ายทั้งหมด: $totalAmount บาท',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
