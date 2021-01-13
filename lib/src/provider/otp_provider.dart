import 'package:flutter/widgets.dart';

class OTPProvider with ChangeNotifier {
  final List<String> _otp = List(4);

  String _errorString;
  String errorString() => _errorString;

  void setErrorString(String errorString) {
    this._errorString = errorString;
    notifyListeners();
  }

  void setOTP(String digit, int index) {
    this._otp[index] = digit;
  }

  String otpString() {
    String otpString = "";

    this._otp.forEach((element) {
      if (element != null) {
        otpString = otpString + element;
      }
    });

    return otpString;
  }
}
