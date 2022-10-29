// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:project/model/usermodel.dart';
//
// import '../configs/services/api.dart';
//
//
// class MySearchDelegate extends SearchDelegate {
//
//
//
//
//
//
//   List<String> searcResult = ['fgdrfg','sdasd'];
//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//       onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
//
//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//         IconButton(
//             onPressed: () {
//               if (query.isEmpty) {
//                 close(context, null);
//               } else {
//                 query = '';
//               }
//             },
//             icon: Icon(Icons.clear))
//       ];
//
//   @override
//   Widget buildResults(BuildContext context) => Center(
//         child: Text(query),
//       );
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = searcResult.where((searcResult) {
//       final result = searcResult.toLowerCase();
//       final input = query.toLowerCase();
//
//       return result.contains(input);
//     }).toList();
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestio = suggestions[index];
//
//         return ListTile(
//           title: Text(suggestio),
//           onTap: () {
//             query = suggestio;
//
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }
//
//
//
//
//


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/future_All.dart';
import 'package:project/model/usermodel.dart';

import '../configs/services/api.dart';


class MySearchDelegate extends SearchDelegate {


  // Future<Null> readUser() async {
  //   String url = API.BASE_URL + '/kongkao/showusershop.php?isAdd=true';
  //
  //   Response response = await Dio().get(url);
  //   print('response$response');
  //   var result = jsonDecode(response.data); //ดึงข้อมูลมา
  //   // print("result>>>>$result");
  //   if (result.toString() != 'null') {
  //     // print("have");
  //     for (var map in result) {
  //       UserModel userModel = UserModel.fromJson(map);
  //       setState(() {
  //         userModels.add(userModel);
  //
  //         // productDetel.add(creatListvile(productModel));
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       status = false;
  //     });
  //     print("nohave");
  //   }
  // }
  void readData() async {
    String url = API.BASE_URL + '/kongkao/showusershop.php?isAdd=true';
    Response response = await Dio().get(url);
    var result = jsonDecode(response.data);

  }


  List<String> searcResult = [];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: Icon(Icons.clear))
  ];

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(query),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searcResult.where((searcResult) {
      final result = searcResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestio = suggestions[index];

        return ListTile(
          title: Text(suggestio),
          onTap: () {
            query = suggestio;

            showResults(context);
          },
        );
      },
    );
  }
}





