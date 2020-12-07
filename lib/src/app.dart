import 'package:http/http.dart' as http;
import 'package:coronator/src/controller/exporter.dart';
import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

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
          "/": (context) => InitialController().build(context),
          "/login": (context) => LoginController(api).build(context),
          "/otp": (context) => OTPController(api).build(context),
          "/timeline": (context) => TimelineController().build(context),
        },
      ),
    );
  }
}
