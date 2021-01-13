import 'package:flutter/widgets.dart';

class LoginProvider with ChangeNotifier {
  LoginProvider(this._phoneNumber);

  String _phoneNumber;
  String phoneNumber() => _phoneNumber;

  String _errorString;
  String errorString() => _errorString;

  void setPhoneNumber(String phoneNumber) {
    this._phoneNumber = "+62" + phoneNumber;
  }

  void setErrorString(String errorString) {
    this._errorString = errorString;
    notifyListeners();
  }
}
