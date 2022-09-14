import 'package:flutter/material.dart';

import '../../constants.dart';

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
