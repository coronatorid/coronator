import 'package:flutter/material.dart';

abstract class SettingInterface {
  Future<void> tapLogout(BuildContext context) {
    throw UnimplementedError("tapLogout is not implemented");
  }
}
