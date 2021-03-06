import 'package:coronator/src/serializer/auth_serializer.dart';
import 'package:coronator/src/serializer/user_serializer.dart';

class LoginSerializer {
  final UserSerializer user;
  final AuthSerializer auth;

  LoginSerializer(this.user, this.auth);

  static LoginSerializer fromJson(Map<String, dynamic> json) {
    return LoginSerializer(
      UserSerializer.fromJson(json['user']),
      AuthSerializer.fromJson(json['auth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": this.user.toJson(),
      "auth": this.auth.toJson(),
    };
  }
}
