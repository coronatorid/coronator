import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';

class AboutProvider with ChangeNotifier {
  PackageInfo packageInfo;

  void init() async {
    this.packageInfo = await PackageInfo.fromPlatform();
    notifyListeners();
  }
}
