import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/screen/initial_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class InitialController {
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLogin()) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/timeline', (Route<dynamic> route) => false);
    }

    return InitialScreen();
  }
}
