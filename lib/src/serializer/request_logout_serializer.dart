import 'package:coronator/src/interface/request_interface.dart';

class RequestLogoutSerializer implements RequestInterface {
  final String token;

  RequestLogoutSerializer(
    this.token,
  );

  @override
  Map<String, dynamic> toJson() {
    return {
      'token': this.token,
    };
  }
}
