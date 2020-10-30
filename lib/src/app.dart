import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/screen/exporter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final String serverURL;

  App({
    Key key,
    @required this.serverURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Coronator',
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => InitialScreen(),
          "/login": (context) => LoginScreen(),
        },
      ),
    );
  }
}
