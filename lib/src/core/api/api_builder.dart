import 'dart:convert';
import 'package:coronator/src/core/api/api_exception.dart';
import 'package:coronator/src/interface/request_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class APIBuilder {
  final http.Client _client;
  final String serverHost;

  APIBuilder(this._client, this.serverHost);

  dynamic post(
      BuildContext context, String path, RequestInterface requestInterface,
      {dynamic responseMapper, String token}) async {
    http.Response response = await this._client.post(
          this.buildURL(context, path),
          body: jsonEncode(requestInterface.toJson()),
          headers: this.buildHeaders(context, token: token),
        );
    this.errorMapper(response);
    Map<String, dynamic> json = jsonDecode(response.body);

    if (responseMapper != null) {
      return responseMapper(json);
    }

    return json;
  }

  Map<String, String> buildHeaders(
    BuildContext context, {
    String token,
    contentType = 'application/json',
  }) {
    Map<String, String> headers = {"Content-Type": contentType};

    if (token != null) {
      headers["Authorization"] = "Bearer " + token;
    }

    return headers;
  }

  String buildURL(BuildContext context, String url) {
    return this.serverHost + url;
  }

  void errorMapper(http.Response response) {
    if (response.statusCode < 400) return;

    if (response.body.length == 0)
      throw ServerExceptionNoBodies(response.statusCode);

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode >= 500) {
      throw ServerException(response.statusCode, json);
    } else if (response.statusCode >= 400) {
      throw ClientException(response.statusCode, json);
    }
  }
}
