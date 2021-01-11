import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

class CameraProvider with ChangeNotifier {
  CameraDescription _camera;
  CameraDescription get camera => this._camera;

  CameraController _controller;
  CameraController get controller => this._controller;

  bool _initialized = false;
  bool get initialized => this._initialized;

  Future<void> initialize() async {
    final List<CameraDescription> cameras = await availableCameras();
    this._camera = cameras.first;
    this._controller = CameraController(
      this.camera,
      ResolutionPreset.high,
    );
    await this._controller.initialize();
    print(this._camera.toString());
    print("CAMERA INITIATED");
    this._initialized = true;
    notifyListeners();
  }
}
