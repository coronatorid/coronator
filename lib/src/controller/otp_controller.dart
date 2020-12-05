import 'package:coronator/src/screen/otp_screen.dart';
import 'package:coronator/src/serializer/otp_serializer.dart';
import 'package:flutter/material.dart';

class OtpController {
  OTPSerializer _otpSerializer;

  Widget build(BuildContext context) {
    this._otpSerializer = ModalRoute.of(context).settings.arguments;
    return OtpScreen();
  }
}
