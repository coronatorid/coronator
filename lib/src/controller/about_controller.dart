import 'package:coronator/src/provider/about_provider.dart';
import 'package:coronator/src/screen/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutController {
  Widget build(BuildContext context) {
    AboutProvider aboutProvider = AboutProvider();
    aboutProvider.init();

    return ChangeNotifierProvider(
      create: (_) => aboutProvider,
      child: AboutScreen(),
    );
  }
}
