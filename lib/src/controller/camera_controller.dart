import 'package:camera/camera.dart';
import 'package:coronator/src/interface/camera_interface.dart';
import 'package:coronator/src/provider/camera_provider.dart';
import 'package:coronator/src/screen/camera_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CameraController implements CameraInterface {
  Widget build(BuildContext context) {
    CameraProvider cameraProvider = CameraProvider();
    cameraProvider.initialize();

    return ChangeNotifierProvider(
      create: (context) => cameraProvider,
      child: CameraScreen(this),
    );
  }

  @override
  Future<void> takePicture(BuildContext context) async {
    try {
      CameraProvider cameraProvider =
          Provider.of<CameraProvider>(context, listen: false);

      XFile file = await cameraProvider.controller.takePicture();
      Navigator.of(context).pop(file);
    } catch (e, backtrace) {
      print("ERROR WHEN TAKING PICTURE " + e.toString());
      print("BACKTRACE " + backtrace.toString());
    }
  }
}
