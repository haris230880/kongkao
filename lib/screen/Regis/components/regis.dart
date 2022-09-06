import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Regis/components/body_regis_select_user.dart';
import 'package:project/screen/Regis/components/body_set_password.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_bay.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_sell.dart';
import 'package:project/screen/Regis/components/otp_regis.dart';


import 'bobyaddress/boby_register_address_bay.dart';
import 'bobyaddress/boby_register_address_sell.dart';
import 'bodyregisnumber/body_regis_number_bay.dart';
import 'bodyregisnumber/bory_regis_number_sell.dart';






class RegisScreen extends StatelessWidget {
  const RegisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),backgroundColor: kPrimaryColor),
      body: BodyRegisSelectUser(),
    );
  }
}


class RegisScreenSaleNumber extends StatelessWidget {
  const RegisScreenSaleNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),backgroundColor: kPrimaryColor),
      body: BodyRegisNumberSale(),
    );
  }
}

class RegisScreenBayNumber extends StatelessWidget {
  const RegisScreenBayNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),backgroundColor: kPrimaryColor),
      body: BodyRegisNumberBay(),
    );
  }
}


class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title:  Text("OTP"),backgroundColor: kPrimaryColor,),
      body:  Otp_Regis(),
    );
  }
}


class SetPassWord extends StatefulWidget {
  const SetPassWord({Key? key}) : super(key: key);

  @override
  State<SetPassWord> createState() => _SetPassWordState();
}
class _SetPassWordState extends State<SetPassWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Password'),backgroundColor: kPrimaryColor,),
      body: BodySetPassWord(),
    );
  }
}


class RegisterSale extends StatefulWidget {
  const RegisterSale({Key? key}) : super(key: key);

  @override
  _RegisterSaleState createState() => _RegisterSaleState();
}
class _RegisterSaleState extends State<RegisterSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('RegisSale'),backgroundColor: kPrimaryColor,),
      body: BodyRegisterSale(),
    );
  }
}



class RegisterBay extends StatefulWidget {
  const RegisterBay({Key? key}) : super(key: key);

  @override
  State<RegisterBay> createState() => _RegisterBayState();
}
class _RegisterBayState extends State<RegisterBay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('RegisterSale'),backgroundColor: kPrimaryColor,),
      body: BodyRegisterBay(),
    );
  }
}


class RegisterAddressSell extends StatefulWidget {
  const RegisterAddressSell({Key? key}) : super(key: key);

  @override
  State<RegisterAddressSell> createState() => _RegisterAddressSellState();
}

class _RegisterAddressSellState extends State<RegisterAddressSell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('RegisterAddressSell'),backgroundColor: kPrimaryColor,),
      body: BobyRegisterAddressSell(),
    );
  }
}


class RegisterAddressBay extends StatefulWidget {
  const RegisterAddressBay({Key? key}) : super(key: key);

  @override
  State<RegisterAddressBay> createState() => _RegisterAddressBayState();
}

class _RegisterAddressBayState extends State<RegisterAddressBay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('RegisterAddressBay'),backgroundColor: kPrimaryColor,),
      body: BobyRegisterAddressBay(),
    );
  }
}
