class OTPSerializer {
  final String phoneNumber;
  final DateTime sentTime;

  OTPSerializer(this.phoneNumber, this.sentTime);

  static OTPSerializer fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['data'];

    return OTPSerializer(
      data['phone_number'],
      DateTime.parse(data['sent_time']),
    );
  }
}
