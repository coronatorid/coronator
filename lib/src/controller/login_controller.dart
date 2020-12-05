import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/interface/login_interface.dart';
import 'package:coronator/src/provider/login_provider.dart';
import 'package:coronator/src/screen/login_screen.dart';
import 'package:coronator/src/serializer/otp_serializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';

class LoginController implements LoginInterface {
  final API _api;

  Lock _sendOtpLock = Lock();
  bool _sendOtpClicked = false;

  LoginController(this._api);

  Widget build(BuildContext context) {
    return Provider(
      create: (context) => LoginProvider(""),
      child: LoginScreen(this),
    );
  }

  void sendOtp(BuildContext context) async {
    Scaffold.of(context).hideCurrentSnackBar();

    this._sendOtpLock.synchronized(() async {
      if (this._sendOtpClicked) {
        return;
      } else {
        this._sendOtpClicked = true;
      }

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

        OTPSerializer otpSerializer = await this._api.auth().requestOTP(
              context,
              loginProvider.phoneNumber(),
            );

        print(otpSerializer.phoneNumber.toString());
        print(otpSerializer.sentTime.toString());

        Navigator.of(context).pushNamed('/otp', arguments: otpSerializer);
      } catch (e, backtrace) {
        print("API ERROR: " + e.toString());
        print("STACKTRACE: " + backtrace.toString());
      } finally {
        this._sendOtpClicked = false;
      }
    });
  }
}
