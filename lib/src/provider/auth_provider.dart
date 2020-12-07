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

    this.notifyListeners();
  }

  bool isLogin() {
    if (this.isInitialized() == false) {
      print("AUTH NOT INITIALIZED");
      return false;
    }

    if (this._getUserCredential() == null) {
      print("AUTH NOT LOGIN YET");
      return false;
    }

    return true;
  }

  bool isInitialized() {
    return this._sp != null;
  }

  String _getUserCredential() {
    return this._sp?.getString("USER_CREDENTIALS");
  }

  Future<void> authorize(LoginSerializer loginSerializer) async {
    this._sp?.setString(
          "USER_CREDENTIALS",
          jsonEncode(loginSerializer.toJson()),
        );
    this.notifyListeners();
  }

  void revoke() async {
    await this._sp.remove("USER_CREDENTIALS");
  }

  LoginSerializer getLogin() {
    if (this.isLogin() == false) {
      return null;
    }

    return LoginSerializer.fromJson(
      jsonDecode(this._getUserCredential()),
    );
  }
}
