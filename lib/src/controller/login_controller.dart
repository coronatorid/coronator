import 'package:coronator/src/interface/login_interface.dart';
import 'package:coronator/src/provider/login_provider.dart';
import 'package:coronator/src/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginController implements LoginInterface {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(""),
      child: LoginScreen(this),
    );
  }

  void sendOtp(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);

    RegExp regExp = new RegExp(
      r"^\+62\d{10,12}",
      caseSensitive: false,
      multiLine: false,
    );

    if (regExp.hasMatch(loginProvider.phoneNumber()) == false) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Nomor telfon tidak valid"),
      ));
      return;
    }

    Navigator.of(context).pushNamed('/otp');
  }
}
