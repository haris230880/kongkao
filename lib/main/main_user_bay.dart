// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../screen/USER/BAY/HOME/components/home_screenbay.dart';
// import '../future_All.dart';
// import '../screen/USER/BAY/HomePageBay.dart';
//
// class MainUserBay extends StatefulWidget {
//   const MainUserBay({Key? key}) : super(key: key);
//
//   @override
//   State<MainUserBay> createState() => _MainUserBayState();
// }
//
// class _MainUserBayState extends State<MainUserBay> {
//   @override
//   void initState() {
//     super.initState();
//     finduser();
//   }
//
//   Future<Null> finduser() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       userid = preferences.getString('phoneNumber')!;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(userid == null ? 'mainsell' : '$userid loginBay'),
//           IconButton(onPressed: () => signOutprocess(context), icon: Icon(Icons.exit_to_app)),
//         ],
//       )),
//       body: Center(
//         child: Text('phone$userid '),
//       ),
//     );
//   }
// }
