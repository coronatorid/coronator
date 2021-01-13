import 'package:coronator/src/controller/timeline_controller.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/screen/initial_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class InitialController {
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    print("INITIAL CONTROLLER LOAD");
    print("LOGIN?: " + authProvider.isLogin().toString());

    if (authProvider.isLogin()) {
      return TimelineController().build(context);
    }

    // TODO: move this to timeline
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   LocationPermission permission = await Geolocator.requestPermission();
    //   print(permission.toString());
    // });

    return InitialScreen();
  }
}
