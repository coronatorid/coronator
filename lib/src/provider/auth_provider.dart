import 'dart:convert';

import 'package:coronator/src/serializer/login_serializer.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  SharedPreferences _sp;

  void initialize(SharedPreferences sp) {
    if (sp != null) {
      this._sp = sp;
    }
  }

  bool isLogin() {
    if (this.isInitialized() == false) {
      return false;
    }

    if (this._getUserCredential() == null) {
      return false;
    }

    return true;
  }

  bool isInitialized() {
    return this._sp != null;
  }

  String _getUserCredential() {
    return this._sp.getString("USER_CREDENTIALS");
  }

  Future<void> authorize(LoginSerializer loginSerializer) async {
    this._sp.setString(
          "USER_CREDENTIALS",
          jsonEncode(loginSerializer.toJson()),
        );
  }

  LoginSerializer getLogin() {
    return LoginSerializer.fromJson(
      jsonDecode(this._getUserCredential()),
    );
  }
}
