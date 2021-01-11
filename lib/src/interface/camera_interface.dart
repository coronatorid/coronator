import 'package:flutter/material.dart';

abstract class CameraInterface {
  Future<void> takePicture(BuildContext context);
}
