import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:geolocator/geolocator.dart';

class TrackerUpdate {
  final AuthProvider authProvider;
  final API api;

  TrackerUpdate(this.authProvider, this.api);

  Future<void> perform() async {
    if (authProvider.isLogin() == false) {
      return;
    }

    if (await GeolocatorPlatform.instance.isLocationServiceEnabled() == false) {
      print("LOCATION UPDATE FAILED BECAUSE LOCATION SERVICE DISABLED");
      return;
    }

    if (await Geolocator.checkPermission() ==
        LocationPermission.deniedForever) {
      print(
          "LOCATION UPDATE FAILED BECAUSE LOCATION PERMISSION PERMANENTLY DENIED");
      return;
    }

    print("START LOCATION UPDATE");

    Position position = await Geolocator.getCurrentPosition();
    await api.track().track(
          null,
          position.latitude,
          position.longitude,
          authProvider: authProvider,
        );

    print("FINISH LOCATION UPDATE");
  }
}
