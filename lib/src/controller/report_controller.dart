import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/provider/report_provider.dart';
import 'package:coronator/src/screen/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportController {
  final API api;

  ReportController(this.api);

  Widget build(BuildContext context) {
    ReportProvider reportProvider = ReportProvider(api);
    reportProvider.initialize(context);

    return ChangeNotifierProvider(
      create: (context) {
        return reportProvider;
      },
      builder: (BuildContext context, Widget child) {
        return child;
      },
      child: ReportScreen(),
    );
  }
}
