import 'package:coronator/src/interface/request_interface.dart';

class RequestOTPSerializer implements RequestInterface {
  final String phoneNumber;
  final String clientUID;
  final String clientSecret;

  RequestOTPSerializer(this.phoneNumber, this.clientUID, this.clientSecret);

  @override
  Map<String, dynamic> toJson() {
    return {
      'phone_number': this.phoneNumber,
      'client_uid': this.clientUID,
      'client_secret': this.clientSecret,
    };
  }
}
