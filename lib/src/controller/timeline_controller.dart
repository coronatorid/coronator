import 'package:coronator/src/interface/timeline_interface.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/screen/timeline_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';
import 'package:workmanager/workmanager.dart';

class TimelineController implements TimelineInterface {
  Lock _tapLogoutLock = Lock();
  bool _tapLogoutClicked = false;

  Widget build(BuildContext context) {
    Workmanager.registerPeriodicTask(
      "locationUpdateJob",
      "locationUpdate",
      frequency: Duration(minutes: 15),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    return TimelineScreen(this);
  }

  void tapLogout(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    this._tapLogoutLock.synchronized(() async {
      if (this._tapLogoutClicked) {
        return;
      } else {
        this._tapLogoutClicked = true;
      }

      try {
        authProvider.revoke();
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
