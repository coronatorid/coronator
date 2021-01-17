import 'dart:async';
import 'package:coronator/src/job/tracker_update.dart';
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

// TODO: REFACTORING THIS IN THE FUTURE
void performBackgroundJob() {
  Workmanager.executeTask((task, inputData) async {
    try {
      print("START BACKGROUND JOB");

      const String serverHost = String.fromEnvironment("SERVER_HOST");

      print("COMPLETE GET ENVIRONMENT VARIABLE");

      AuthProvider authProvider;
      API api;

      authProvider = AuthProvider(api);
      await Lock().synchronized(() async {
        SharedPreferences sp;
        sp = await SharedPreferences.getInstance();
        authProvider.initialize(sp);
      });
      print("AUTH PROVIDER INITIATION COMPLETE");

      api = API(http.Client(), serverHost);
      print("API INITIATION COMPLETE");

      switch (task) {
        case "locationUpdate":
          await TrackerUpdate(authProvider, api).perform();
          break;
      }

      print("TASK COMPLETED");
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
  final bool workerDebugMode;

  App({
    Key key,
    @required this.serverHost,
    @required this.clientUID,
    @required this.clientSecret,
    @required this.workerDebugMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    API api = API(http.Client(), this.serverHost);
    AuthProvider authProvider = AuthProvider(api);

    Workmanager.initialize(
      performBackgroundJob,
      isInDebugMode: this.workerDebugMode,
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
        debugShowCheckedModeBanner: false,
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
          "/report": (context) => ReportController(api).build(context),
          "/timeline": (context) => TimelineController().build(
                context,
              ),
          "/camera": (context) => CameraController().build(context),
          "/setting": (context) => SettingController().build(context),
        },
      ),
    );
  }
}
