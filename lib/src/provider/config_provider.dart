class ConfigProvider {
  String _clientUID;
  String _clientSecret;

  String get clientUID => this._clientUID;
  String get clientSecret => this._clientSecret;

  ConfigProvider(String clientUID, String clientSecret) {
    this._clientUID = clientUID;
    this._clientSecret = clientSecret;
  }
}
