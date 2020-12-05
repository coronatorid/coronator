import 'package:coronator/src/interface/login_interface.dart';
import 'package:coronator/src/provider/login_provider.dart';
import 'package:coronator/src/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';

class LoginController implements LoginInterface {
  Lock _sendOtpLock = Lock();
  bool _sendOtpClicked = false;

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(""),
      child: LoginScreen(this),
    );
  }

  void sendOtp(BuildContext context) {
    Scaffold.of(context).hideCurrentSnackBar();

    this._sendOtpLock.synchronized(() {
      if (this._sendOtpClicked) return;

      try {
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

        loginProvider.setPhoneNumber("");
        Navigator.of(context).pushNamed('/otp');
      } catch (e) {}
    });
  }
}
