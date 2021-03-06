import 'dart:convert';
import 'dart:io';
import 'package:coronator/src/core/api/api_exception.dart';
import 'package:coronator/src/interface/request_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as httpParser;
import 'package:mime/mime.dart';

// CONTEXT CAN BE NULL IN THIS CLASS.
// TODO: REMOVE CONTEXT DEPENDENCIES SINCE IT'S ALSO CALL IN BACKGROUND JOB
class APIBuilder {
  final http.Client _client;
  final String serverHost;

  APIBuilder(this._client, this.serverHost);

  Future<dynamic> get(
    BuildContext context,
    String path, {
    dynamic responseMapper,
    String token,
  }) async {
    http.Response response = await this._client.get(
          this.buildURL(context, path),
          headers: this.buildHeaders(context, token: token),
        );
    this.errorMapper(response);
    Map<String, dynamic> json = jsonDecode(response.body);
    if (responseMapper != null) {
      return responseMapper(json['data']);
    }

    return json;
  }

  Future<dynamic> multipart(
    BuildContext context,
    String path,
    File file, {
    dynamic responseMapper,
    String token,
  }) async {
    var uri = Uri.parse(this.buildURL(context, path));
    var request = http.MultipartRequest('POST', uri);
    var mime = lookupMimeType(file.path).split("/");
    request.files.add(
      await http.MultipartFile.fromPath(
        "file",
        file.path,
        contentType: httpParser.MediaType(
          mime.first,
          mime.last,
        ),
      ),
    );
    request.headers.addAll(this.buildHeaders(context, token: token));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    this.errorMapper(response);
    Map<String, dynamic> json = jsonDecode(response.body);

    if (responseMapper != null) {
      return responseMapper(json['data']);
    }

    return json;
  }

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
      return responseMapper(json['data']);
    }

    return json;
  }

  Future<dynamic> delete(
    BuildContext context,
    String path, {
    dynamic responseMapper,
    String token,
  }) async {
    http.Response response = await this._client.delete(
          this.buildURL(context, path),
          headers: this.buildHeaders(context, token: token),
        );
    this.errorMapper(response);
    Map<String, dynamic> json = jsonDecode(response.body);

    if (responseMapper != null) {
      return responseMapper(json['data']);
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
