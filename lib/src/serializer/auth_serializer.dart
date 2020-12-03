class AuthSerializer {
  final String token;
  final String scopes;
  final int expiresIn;

  AuthSerializer(this.token, this.scopes, this.expiresIn);

  static AuthSerializer fromJson(Map<String, dynamic> json) {
    return AuthSerializer(
      json['token'],
      json['scope'],
      json['expires_in'],
    );
  }
}
