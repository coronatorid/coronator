import 'package:coronator/src/core/api/api_builder.dart';
import 'package:coronator/src/core/api/auth_api.dart';
import 'package:http/http.dart' as http;

class API {
  http.Client _client;
  String _serverHost;

  API(this._client, this._serverHost);

  static API fabricate(String serverHost) {
    return API(http.Client(), serverHost);
  }

  AuthAPI auth() {
    return AuthAPI(APIBuilder(this._client, this._serverHost));
  }
}
