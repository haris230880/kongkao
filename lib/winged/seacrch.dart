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

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/future_All.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/screen/USER/SALE/components/shopdetait.dart';
import 'package:project/winged/searchbox.dart';

import '../configs/services/api.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class FetchUser {
  var data = [];
  List<UserModel> results = [];

  String fetchurl = API.BASE_URL + '/kongkao/showusershop.php?isAdd=true';

  Future<List<UserModel>> getUserList({String? query}) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        results = data.map((e) => UserModel.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.shop!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print('apo error');
      }
    } on Exception catch (e) {
      print('error:$e');
    }
    return results;
  }
}

class MySearchDelegate extends SearchDelegate {
  Timer? _debounceTimer;
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

  FetchUser _userList = FetchUser();
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: _userList.getUserList(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          var data = snapshot.data;
          if (data == null || data.isEmpty) {
            return Center(
              child: Text('No Results Found'),
            );
          }
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextButton(
                  onPressed: () {
                    UserModel selectedUser = data![index]; // Get the selected UserModel from the search results
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => ShopDetait(userModel: selectedUser),
                    );
                    Navigator.pushReplacement(context, route);
                  },

                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: fixsixe.listViewImgSize,
                        height: fixsixe.listViewImgSize,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              API.BASE_URL + '${data[index].photo}',
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryLightColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              //color: Colors.lightGreen,
                              blurRadius: 1.0,
                              offset: Offset(0, 5),
                            ),
                            BoxShadow(
                                color: Colors.white, offset: Offset(-5, 0)),
                            BoxShadow(
                                color: Colors.white, offset: Offset(5, 0)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 15, left: 10),
                          height: fixsixe.listViewImgSize,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                //color: Colors.lightGreen,
                                blurRadius: 1.0,
                                offset: Offset(0, 5),
                              ),
                              BoxShadow(
                                  color: Colors.white, offset: Offset(-5, 0)),
                              BoxShadow(
                                  color: Colors.white, offset: Offset(5, 0)),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data[index].shop}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'ค่าบริการ: ${data[index].charge}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'เวลาทำการ: ${data[index].time}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Cancel the previous timer if it exists
    _debounceTimer?.cancel();

    // Set a new timer to delay the API request
    _debounceTimer = Timer(Duration(milliseconds: 2000), () {
      showResults(context);
    });

    return Center(
      child: Text('Search Users'),
    );
  }
}
