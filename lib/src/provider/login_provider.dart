import 'package:flutter/widgets.dart';

class LoginProvider with ChangeNotifier {
  LoginProvider(this._phoneNumber);

  String _phoneNumber;

  String phoneNumber() {
    return "+62" + this._phoneNumber;
  }

  void setPhoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
  }
}
