import 'package:coronator/src/controller/exporter.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/provider/config_provider.dart';
import 'package:coronator/src/screen/exporter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthProvider()),
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
          "/": (context) => InitialScreen(),
          "/login": (context) => LoginController().build(context),
          "/otp": (context) => OtpController().build(context),
          "/timeline": (context) => TimelineScreen(),
        },
      ),
    );
  }
}
