import 'package:camera/camera.dart';
import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/core/api/api_exception.dart';
import 'package:coronator/src/interface/report_interface.dart';
import 'package:coronator/src/provider/report_provider.dart';
import 'package:coronator/src/screen/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:synchronized/synchronized.dart';

class ReportController implements ReportInterface {
  final API api;

  Lock _reportLock = Lock();
  bool _reportClicked = false;

  ReportController(this.api);

  Widget build(BuildContext context) {
    ReportProvider reportProvider = ReportProvider(api);
    reportProvider.initialize(context);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.microphone,
      ].request();
      print(statuses.toString());
    });

    return ChangeNotifierProvider(
      create: (context) {
        return reportProvider;
      },
      child: ReportScreen(this),
    );
  }

  @override
  Future<void> removeReport(BuildContext context) async {
    ReportProvider reportProvider = Provider.of<ReportProvider>(
      context,
      listen: false,
    );

    this._reportLock.synchronized(() async {
      if (this._reportClicked) {
        return;
      } else {
        this._reportClicked = true;
      }

      try {
        await reportProvider.removeReport(context);
      } on APIException catch (e, backtrace) {
        print("API ERROR: " + e.toString());
        print("STACKTRACE: " + backtrace.toString());
      } catch (e, backtrace) {
        print("ERROR: " + e.toString());
        print("STACKTRACE: " + backtrace.toString());
      } finally {
        this._reportClicked = false;
      }
    });
  }

  @override
  Future<void> setPicture(BuildContext context) async {
    ReportProvider reportProvider = Provider.of<ReportProvider>(
      context,
      listen: false,
    );

    var file = await Navigator.of(context).pushNamed("/camera");
    if (file == null) {
      print("FILE IS NULL");
    } else {
      reportProvider.setFile(file);
      print("FILE PATH: " + reportProvider.file.path);
    }
  }
}
