class OTPSerializer {
  final String phoneNumber;
  final DateTime sentTime;

  OTPSerializer(this.phoneNumber, this.sentTime);

  static OTPSerializer fromJson(Map<String, dynamic> json) {
    return OTPSerializer(
      json['phone_number'],
      DateTime.parse(json['sent_time']),
    );
  }
}
