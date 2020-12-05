import 'package:coronator/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  const String clientUID =
      String.fromEnvironment("CLIENT_UID", defaultValue: "default_client_uid");
  const String clientSecret = String.fromEnvironment("CLIENT_SECRET",
      defaultValue: "default_client_secret");
  const String serverHost = String.fromEnvironment("SERVER_HOST");

  print("CLIENT UID: " + clientUID);
  print("CLIENT SECRET: " + clientSecret);
  print("SERVER HOST: " + serverHost);

  runApp(App(
    serverHost: serverHost,
    clientUID: clientUID,
    clientSecret: clientSecret,
  ));
}
