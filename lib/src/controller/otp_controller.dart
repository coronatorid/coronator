import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/core/api/api_exception.dart';
import 'package:coronator/src/interface/otp_interface.dart';
import 'package:coronator/src/provider/otp_provider.dart';
import 'package:coronator/src/screen/otp_screen.dart';
import 'package:coronator/src/serializer/login_serializer.dart';
import 'package:coronator/src/serializer/otp_serializer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';

class OTPController implements OTPInterface {
  final API _api;

  OTPController(this._api);

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

        print("OTP STRING: " + otpProvider.otpString());

        LoginSerializer loginSerializer = await this._api.auth().login(
              context,
              phoneNumber: this._otpSerializer.phoneNumber,
              otpCode: otpProvider.otpString(),
              otpSentTime: this._otpSerializer.sentTime,
            );

        print("USER: " + loginSerializer.user.toJson().toString());
        print("AUTH: " + loginSerializer.auth.toJson().toString());

        Navigator.of(context).pushNamedAndRemoveUntil(
            '/timeline', (Route<dynamic> route) => false);
      } on APIException catch (e, backtrace) {
        print("API ERROR: " + e.toString());
        print("API STATUS CODE: " + e.statusCode.toString());
        print("DETAIL: " + e.error.firstError().detail);
        print("STACKTRACE: " + backtrace.toString());
      } catch (e, backtrace) {
        print("ERROR: " + e.toString());
        print("STACKTRACE: " + backtrace.toString());
      } finally {
        this._submitOTPClicked = false;
      }
    });
  }
}
