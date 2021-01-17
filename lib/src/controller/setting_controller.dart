import 'package:coronator/src/interface/setting_interface.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';

class SettingController implements SettingInterface {
  Lock _tapLogoutLock = Lock();
  bool _tapLogoutClicked = false;

  Widget build(BuildContext context) {
    return SettingScreen(
      interface: this,
    );
  }

  Future<void> tapLogout(BuildContext context) async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    this._tapLogoutLock.synchronized(() async {
      if (this._tapLogoutClicked) {
        return;
      } else {
        this._tapLogoutClicked = true;
      }

      try {
        await authProvider.revoke(context);
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/',
          (Route<dynamic> route) => false,
        );
      } finally {
        this._tapLogoutClicked = false;
      }
    });
  }
}
