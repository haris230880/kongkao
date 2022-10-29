import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/USER/BAY/oeder_list_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../configs/services/api.dart';
import '../../../../../constants.dart';
import '../../../../../future_All.dart';
import '../../../../../model/producttypemodel.dart';
import '../../../../Login/components/login_screen.dart';
import '../../HomePageBay.dart';
import '../../ProFile/body_profilebay.dart';
import '../../Product/addproduct.dart';
import 'appbarhomepagebay.dart';
import 'body_homebay.dart';

class HomeBayScreen extends StatefulWidget {
  const HomeBayScreen({Key? key}) : super(key: key);

  @override
  State<HomeBayScreen> createState() => _HomeBayScreenState();
}

class _HomeBayScreenState extends State<HomeBayScreen> {
  List<TypeProductModel> typeProductModels = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      finduser();
      readTypeProduct();
    });
  }
  Future<Null> readTypeProduct() async {
    String url = API.BASE_URL + '/kongkao/showtypeproduct.php?isAdd=true';

    Response response = await Dio().get(url);
    print('response$response');
    var result = jsonDecode(response.data); //ดึงข้อมูลมา
    // print("result>>>>$result");
    if (result.toString() != 'null') {
      // print("have");
      for (var map in result) {
        TypeProductModel typeProductModel = TypeProductModel.fromJson(map);
        setState(() {
          typeProductModels.add(typeProductModel);
        });
      }
    } else {
      normaDiolog(context, 'Error');
      print("nohave");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarBay(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          HeaderHomePageBay(),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text('ประเภท',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPaddin / 4),
                  height: 3,
                  width: 70,
                  color: kPrimaryLightColor
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(height: 200,
            child: GridView.builder(
                itemCount: typeProductModels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1.1,
                  mainAxisExtent: 90,
                ),
                itemBuilder: (context, index) => ItemCardType(
                    typeProductModel: typeProductModels[index])),
          ),

        ],
      ),

    );
  }

  Container HeaderHomePageBay() {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30))),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 10),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Row(
              children: [
                Text(
                  'Hi!!}',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Shop:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
                height: 70,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: kPrimaryColor.withOpacity(0.1)),
                    ]),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddProduct();
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'เพิ่มรายการสินค้า',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryblckColor,
                            fontSize: 18),
                      ),
                      Image.asset('assets/images/box.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCardType extends StatelessWidget {
  final TypeProductModel typeProductModel;
  const ItemCardType({
    super.key,
    required this.typeProductModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderListShop(),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsetsDirectional.all(kDefaultPaddin),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  // fit: BoxFit.cover,
                  image: NetworkImage(
                      API.BASE_URL + typeProductModel.typeproductcolphoto),
                )),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
            child: Column(
              children: [
                Text(
                  ' ${typeProductModel.typeproductname}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




//
//
//
//
//
//
//
// ...................................
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mini_project/src/configs/api.dart';
// import 'package:mini_project/src/configs/app_route.dart';
// import 'package:mini_project/src/pages/condo/condo_model.dart';
// import 'package:mini_project/src/services/network.dart';
//
//
// class CondoPage extends StatefulWidget {
//   @override
//   _CondoPageState createState() => _CondoPageState();
// }
//
// class _CondoPageState extends State<CondoPage> {
//
//   Future<CondoModel> _future;
//   List countries = [];
//   List filteredCountries = [];
//   bool isSearching = false;
//   void _filterCountries(value) {
//     setState(() {
//       filteredCountries = countries
//           .where((country) =>
//           country['name'].toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: !isSearching
//             ? Text('คอนโดมิเนียม')
//             : TextField(
//           onChanged: (value) {
//             _filterCountries(value);
//           },
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//               icon: Icon(
//                 Icons.search,
//                 color: Colors.white,
//               ),
//               hintText: "Search",
//               hintStyle: TextStyle(color: Colors.white)),
//         ),
//         actions: <Widget>[
//           isSearching
//               ? IconButton(
//             icon: Icon(Icons.cancel),
//             onPressed: () {
//               setState(() {
//                 this.isSearching = false;
//                 filteredCountries = countries;
//               });
//             },
//           )
//               : IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // showSearch(context: context, delegate: Search());
//
//               setState(() {
//                 this.isSearching = true;
//               });
//             },
//           )
//         ],
//       ),
//       body: Container(
//         child: FutureBuilder<CondoModel>(
//           future: NetworkService().getAllCondoDio(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data.condos.length,
//                 itemBuilder: (context, index) {
//                   var condo = snapshot.data.condos[index];
//
//                   return Container(
//                     child: ListTile(
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, AppRoute.condodetailRoutr,
//                             arguments: condo);
//                       },
//                       title: Row(
//                         children: [
//                           SizedBox(
//                             width: 150,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.network(
//                                 API.CONDO_IMAGE + condo.condoimage,
//                               ),
//                             ),
//                           ),
//                           Flexible(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     condo.condoName,
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.blue,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.redAccent,
//         child: Icon(Icons.assignment_outlined),
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return Dialog(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40)),
//                   elevation: 16,
//                   child: Container(
//                     child: ListView(
//                       shrinkWrap: true,
//                       children: <Widget>[
//                         SizedBox(height: 150),
//                         Center(child: Text('Leaderboard')),
//                         SizedBox(height: 150),
//                         // Checkbox(
//                         //     value: monVal,
//                         //     onChanged: (bool value) {
//                         //       setState(() {
//                         //         monVal = value;
//                         //       });
//                         //     })
//                       ],
//                     ),
//                   ),
//                 );
//               });
//           // // Navigator.pushNamed(context, AppRoute.videoRoute,
//           //     arguments: _movieModel.id);
//         },
//       ),
//     );
//   }
// }
