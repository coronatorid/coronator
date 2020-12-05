import 'package:coronator/src/interface/request_interface.dart';
import 'package:flutter/material.dart';

class RequestLoginSerializer implements RequestInterface {
  final String phoneNumber;
  final String clientUID;
  final String clientSecret;
  final String otpCode;
  final String otpSentTime;

  RequestLoginSerializer({
    @required this.phoneNumber,
    @required this.clientUID,
    @required this.clientSecret,
    @required this.otpCode,
    @required this.otpSentTime,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone_number': this.phoneNumber,
      'client_uid': this.clientUID,
      'client_secret': this.clientSecret,
      'otp_code': this.otpCode,
      'otp_sent_time': this.otpSentTime,
    };
  }
}
