import 'package:coronator/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  const String clientUID =
      String.fromEnvironment("CLIENT_UID", defaultValue: "default_client_uid");
  const String clientSecret = String.fromEnvironment("CLIENT_SECRET",
      defaultValue: "default_client_secret");
  const String serverHost = String.fromEnvironment("SERVER_HOST");
  const String workerMode =
      String.fromEnvironment("WORKER_MODE", defaultValue: "debug");

  print("CLIENT UID: " + clientUID);
  print("CLIENT SECRET: " + clientSecret);
  print("SERVER HOST: " + serverHost);
  print("WORKER DEBUG MODE: " + workerMode);

  runApp(App(
    serverHost: serverHost,
    clientUID: clientUID,
    clientSecret: clientSecret,
    workerDebugMode: workerMode == "debug" || workerMode != "release",
  ));
}
