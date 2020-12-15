import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TrackerUpdate {
  final AuthProvider authProvider;
  final API api;

  TrackerUpdate(this.authProvider, this.api);

  Future<void> perform() async {
    if (authProvider.isLogin() == false) {
      return;
    }

    if (await Permission.locationAlways.status.isDenied) {
      print("LOCATION UPDATE FAILED BECAUSE LOCATION STATUS DENIED");
      return;
    }

    print("START LOCATION UPDATE");

    await api.track().track(
          null,
          21.4221475,
          39.8365865,
          authProvider: authProvider,
        );

    print("FINISH LOCATION UPDATE");
  }
}
