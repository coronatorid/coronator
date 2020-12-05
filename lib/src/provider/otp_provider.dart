class OTPProvider {
  final List<String> _otp = List(4);

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
