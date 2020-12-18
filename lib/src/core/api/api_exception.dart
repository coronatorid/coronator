import 'package:coronator/src/serializer/error_serializer.dart';

class APIException implements Exception {
  final int statusCode;
  final Map<String, dynamic> _json;

  ErrorSerializer _error;
  ErrorSerializer get error => _error;

  APIException(this.statusCode, this._json) {
    this._error = ErrorSerializer.fromJson(this._json);
  }

  String toString() {
    return "API Exception: status code `" + this.statusCode.toString() + "`";
  }
}

class ClientException extends APIException {
  ClientException(int statusCode, Map<String, dynamic> json)
      : super(statusCode, json);
}

class ServerException extends APIException {
  ServerException(int statusCode, Map<String, dynamic> json)
      : super(statusCode, json);
}

class ServerExceptionNoBodies extends APIException {
  static final Map<String, List<dynamic>> defaultJson = {
    "errors": [
      {"code": 00000, "detail": "Terjadi kesalahan pada server."}
    ],
  };

  ServerExceptionNoBodies(int statusCode) : super(statusCode, defaultJson);
}
