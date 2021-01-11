import 'dart:io';
import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/core/api/api_exception.dart';
import 'package:coronator/src/serializer/report_serializer.dart';
import 'package:flutter/widgets.dart';

class ReportProvider with ChangeNotifier {
  final API _api;

  ReportProvider(this._api);

  ReportSerializer _data;
  ReportSerializer get data => this._data;

  File _file;
  File get file => this._file;

  Future<void> initialize(BuildContext context) async {
    try {
      ReportSerializer reportSerializer =
          await this._api.report().getReportMe(context);
      this._data = reportSerializer;
      this._file = null;

      print("INITIALIZE REPORT COMPLETED");
      notifyListeners();
    } on APIException catch (e) {
      print("GOT API EXCEPTION " + e.toString());

      if (e.statusCode == 404) {
        print("User has not reported any data yet");
        return;
      }

      rethrow;
    } catch (e) {
      print("GOT OTHER EXCEPTION " + e.toString());
    }
  }

  Future<void> report(BuildContext context) async {
    print("START SUBMITTING REPORT");

    try {
      await this._api.report().createReport(context, file);
      await this.initialize(context);
      print("SUBMIT REPORT COMPLETED");
    } on APIException catch (e, backtrace) {
      print("GOT API EXCEPTION " + e.toString());
      print("BACKTRACE " + backtrace.toString());
      rethrow;
    } catch (e, backtrace) {
      print("GOT OTHER EXCEPTION " + e.toString());
      print("BACKTRACE " + backtrace.toString());
    }
  }

  Future<void> removeReport(BuildContext context) async {
    try {
      await this._api.report().deleteReport(context);
      this._data = null;
      print("REMOVE REPORT COMPLETE");
      notifyListeners();
    } catch (e, backtrace) {
      print("GOT API EXCEPTION " + e.toString());
      print("BACKTRACE " + backtrace.toString());
    }
  }

  void setFile(File file) {
    this._file = file;
    this.notifyListeners();
  }
}
