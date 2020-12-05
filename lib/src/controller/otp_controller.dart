import 'package:coronator/src/interface/otp_interface.dart';
import 'package:coronator/src/provider/otp_provider.dart';
import 'package:coronator/src/screen/otp_screen.dart';
import 'package:coronator/src/serializer/otp_serializer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';

class OTPController implements OTPInterface {
  OTPSerializer _otpSerializer;

  Lock _submitOTPLock = Lock();
  bool _submitOTPClicked = false;

  Widget build(BuildContext context) {
    this._otpSerializer = ModalRoute.of(context).settings.arguments;
    return Provider(
      create: (context) => OTPProvider(),
      child: OTPScreen(this),
    );
  }

  void submitOTP(BuildContext context) {
    Scaffold.of(context).hideCurrentSnackBar();

    this._submitOTPLock.synchronized(() async {
      try {
        if (this._submitOTPClicked) {
          return;
        } else {
          this._submitOTPClicked = true;
        }

        OTPProvider otpProvider =
            Provider.of<OTPProvider>(context, listen: false);

        if (otpProvider.otpString().length < 4) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Kode OTP tidak valid"),
          ));
          return;
        }

        print("OTP STRING" + otpProvider.otpString());

        // Navigator.of(context).pushNamedAndRemoveUntil(
        //     '/timeline', (Route<dynamic> route) => false);
      } catch (e, backtrace) {
        print("API ERROR: " + e.toString());
        print("STACKTRACE: " + backtrace.toString());
      } finally {
        this._submitOTPClicked = false;
      }
    });
  }
}
