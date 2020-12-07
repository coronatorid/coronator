class AuthSerializer {
  final String token;
  final String scopes;
  final int expiresIn;

  AuthSerializer(this.token, this.scopes, this.expiresIn);

  static AuthSerializer fromJson(Map<String, dynamic> json) {
    return AuthSerializer(
      json['token'],
      json['scopes'],
      json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': this.token,
      'scopes': this.scopes,
      'expires_in': this.expiresIn,
    };
  }
}
