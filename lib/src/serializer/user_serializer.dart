import 'package:coronator/src/interface/request_interface.dart';

class UserSerializer implements RequestInterface {
  final int id;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserSerializer(this.id, this.phone, this.createdAt, this.updatedAt);

  static UserSerializer fromJson(Map<String, dynamic> json) {
    return UserSerializer(
      json['id'],
      json['phone'],
      DateTime.parse(json['created_at']),
      DateTime.parse(json['updated_at']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'phone': this.phone,
      'created_at': this.createdAt.toString(),
      'updated_at': this.updatedAt.toString(),
    };
  }
}
