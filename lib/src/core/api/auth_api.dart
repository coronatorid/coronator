import 'package:coronator/src/core/api/api_builder.dart';
import 'package:coronator/src/provider/config_provider.dart';
import 'package:coronator/src/serializer/login_serializer.dart';
import 'package:coronator/src/serializer/otp_serializer.dart';
import 'package:coronator/src/serializer/request_login_serializer.dart';
import 'package:coronator/src/serializer/request_otp_serializer.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthAPI {
  final APIBuilder _apiBuilder;

  AuthAPI(this._apiBuilder);

  Future<OTPSerializer> requestOTP(
      BuildContext context, String phoneNumber) async {
    ConfigProvider configProvider =
        Provider.of<ConfigProvider>(context, listen: false);

    OTPSerializer otpSerializer = await this._apiBuilder.post(
          context,
          "/authorization/otp-requests",
          RequestOTPSerializer(
            phoneNumber,
            configProvider.clientUID,
            configProvider.clientSecret,
          ),
          responseMapper: OTPSerializer.fromJson,
        );

    return otpSerializer;
  }

  Future<LoginSerializer> login(
    BuildContext context, {
    @required String phoneNumber,
    @required String otpCode,
    @required DateTime otpSentTime,
  }) async {
    ConfigProvider configProvider =
        Provider.of<ConfigProvider>(context, listen: false);

    LoginSerializer loginSerializer = await this._apiBuilder.post(
          context,
          "/authorization/login",
          RequestLoginSerializer(
            clientSecret: configProvider.clientSecret,
            clientUID: configProvider.clientUID,
            otpCode: otpCode,
            phoneNumber: phoneNumber,
            otpSentTime: otpSentTime.toUtc().toIso8601String(),
          ),
          responseMapper: LoginSerializer.fromJson,
        );

    return loginSerializer;
  }
}
