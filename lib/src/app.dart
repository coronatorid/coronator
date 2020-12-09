import 'package:http/http.dart' as http;
import 'package:coronator/src/controller/exporter.dart';
import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';
import 'package:workmanager/workmanager.dart';

void performBackgroundJob() {
  Workmanager.executeTask((task, inputData) async {
    try {
      print("START BACKGROUND JOB");

      const String clientUID = String.fromEnvironment("CLIENT_UID",
          defaultValue: "default_client_uid");
      const String clientSecret = String.fromEnvironment("CLIENT_SECRET",
          defaultValue: "default_client_secret");
      const String serverHost = String.fromEnvironment("SERVER_HOST");

      print("COMPLETE GET ENVIRONMENT VARIABLE");

      AuthProvider authProvider;
      API api;

      authProvider = AuthProvider();
      await Lock().synchronized(() async {
        SharedPreferences sp;
        sp = await SharedPreferences.getInstance();
        authProvider.initialize(sp);
      });
      print("AUTH PROVIDER INITIATION COMPLETE");

      api = API(http.Client(), serverHost);
      print("API INITIATION COMPLETE");

      ConfigProvider configProvider = ConfigProvider(
        clientUID,
        clientSecret,
      );

      print("CONFIG PROVIDER INITIATION COMPLETE");

      switch (task) {
        case "locationUpdate":
          if (authProvider.isLogin() == false) {
            break;
          }

          print("START LOCATION UPDATE");

          Builder(builder: (context) {
            MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => authProvider),
                Provider(create: (context) => configProvider),
              ],
              child: Builder(builder: (BuildContext context) {
                api.track().track(context, 40.8584603, 28.8025043);
                return;
              }),
            ).build(context);
            return;
          });

          break;
      }

      return Future.value(true);
    } catch (e, backtrace) {
      print("FAIL TO DO BACKGROUND JOB: " + e.toString());
      print("BACKTRACE: " + backtrace.toString());
      rethrow;
    }
  });
}

class App extends StatelessWidget {
  final String serverHost;
  final String clientUID;
  final String clientSecret;

  App({
    Key key,
    @required this.serverHost,
    @required this.clientUID,
    @required this.clientSecret,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    API api = API(http.Client(), this.serverHost);
    AuthProvider authProvider = AuthProvider();

    Workmanager.initialize(
      performBackgroundJob,
      isInDebugMode: true,
    );
    Workmanager.registerPeriodicTask(
      "locationUpdateJob",
      "locationUpdate",
    );

    Lock().synchronized(() async {
      SharedPreferences sp;
      sp = await SharedPreferences.getInstance();
      authProvider.initialize(sp);
    });

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return authProvider;
          },
        ),
        Provider(
          create: (context) => ConfigProvider(
            this.clientUID,
            this.clientSecret,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Coronator',
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => InitialController().build(
                context,
              ),
          "/login": (context) => LoginController(api).build(context),
          "/otp": (context) => OTPController(api).build(context),
          "/timeline": (context) => TimelineController().build(
                context,
              ),
        },
      ),
    );
  }
}
