class ErrorSerializer {
  final List<ErrorObjectSerializer> errors;

  ErrorSerializer(this.errors);

  ErrorObjectSerializer firstError() {
    return this.errors.first;
  }

  static ErrorSerializer fromJson(Map<String, dynamic> json) {
    List<ErrorObjectSerializer> errors = [];

    List<dynamic> decodedError = json['errors'];

    decodedError.forEach((element) {
      errors.add(
        ErrorObjectSerializer(
          element['status'].toString(),
          element['detail'],
        ),
      );
    });

    return ErrorSerializer(errors);
  }
}

class ErrorObjectSerializer {
  final String status;
  final String detail;

  ErrorObjectSerializer(this.status, this.detail);
}
