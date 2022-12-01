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
        if(query != null){
          results = results.where((element) => element.shop!.toLowerCase().contains(query.toLowerCase())).toList();
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

class Seacechpage extends StatefulWidget {
  const Seacechpage({Key? key}) : super(key: key);

  @override
  State<Seacechpage> createState() => _SeacechpageState();
}

class _SeacechpageState extends State<Seacechpage> {
  FetchUser _userList = FetchUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/images/logo.jpg')),
            SizedBox(
              width: 10,
            ),
            RichText(
              textAlign: TextAlign.right,
              text: TextSpan(children: [
                TextSpan(
                  text: "K",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                TextSpan(
                  text: "ongkao",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ]),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,
              child: FutureBuilder<List<UserModel>>(
                  future: _userList.getUserList(),
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView.builder(
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: kPrimaryblckColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text('${data?[index].id}'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${data?[index].shop}'),
                                    Text('${data?[index].email}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchUser extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back));
  }


  FetchUser _userList = FetchUser();
  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder<List<UserModel>>(
        future: _userList.getUserList(query: query),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: kPrimaryblckColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('${data?[index].id}'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${data?[index].shop}'),
                          Text('${data?[index].email}'),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Users'),
    );
  }
}

class MySearchDelegate extends SearchDelegate {

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
    return  FutureBuilder<List<UserModel>>(
        future: _userList.getUserList(query: query),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextButton(
                    onPressed: () {
                      // MaterialPageRoute route = MaterialPageRoute(
                      //   builder: (context) => ShopDetait(
                      //     userModel: userModels[index],
                      //   ),
                      // ); //ส้งค่า
                      // Navigator.push(context, route);
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
                                    API.BASE_URL + '${data?[index].photo}'),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: kPrimaryLightColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    //color: Colors.lightGreen,
                                    blurRadius: 1.0,
                                    offset: Offset(0, 5)),
                                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                                BoxShadow(color: Colors.white, offset: Offset(5, 0))
                              ]),
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
                                      offset: Offset(0, 5)),
                                  BoxShadow(
                                      color: Colors.white, offset: Offset(-5, 0)),
                                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                                ]),
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
                                        '${data?[index].shop}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('ค่าบริการ: ${data?[index].charge}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                      Text('เวลาทำการ: ${data?[index].time}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Users'),
    );
  }
}





// class MySearchDelegate extends SearchDelegate {
//   List<String> searcResult = ['1','2'];
//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//       onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
//
//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//     IconButton(
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = '';
//           }
//         },
//         icon: Icon(Icons.clear))
//   ];
//
//   @override
//   Widget buildResults(BuildContext context) => Center(
//     child: Text(query),
//   );
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