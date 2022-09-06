 import 'package:flutter/material.dart';
import 'package:project/screen/Login/components/bodylogin.dart';

import '../../../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),backgroundColor: kPrimaryColor),
      body: BodyLogin(),);
  }
}
