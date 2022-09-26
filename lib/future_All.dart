import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'screen/Login/components/login_screen.dart';

Future<Null> signOutprocess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  // exit(0);
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => LoginScreen(),);
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}


Future<void> normaDiolog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message,style: TextStyle(fontSize: 16),),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      // Foreground color
                      onPrimary: Colors.white,
                      // Background color
                      primary: kPrimaryColor,
                      minimumSize: Size(10, 30))
                  .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'ตกลง',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        // ElevatedButton(
        //   onPressed: () => Navigator.pop(context),
        //   child: Center(
        //       child: Text('ตกลง')),
        // ),
      ],
    ),
  );
}


