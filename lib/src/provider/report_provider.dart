import 'package:camera/camera.dart';
import 'package:coronator/src/core/api.dart';
import 'package:coronator/src/core/api/api_exception.dart';
import 'package:coronator/src/serializer/report_serializer.dart';
import 'package:flutter/widgets.dart';

class ReportProvider with ChangeNotifier {
  final API api;

  ReportProvider(this.api);

  ReportSerializer _data;
  ReportSerializer get data => this._data;

  XFile _file;
  XFile get file => this._file;

  Future<void> initialize(BuildContext context) async {
    try {
      ReportSerializer reportSerializer =
          await this.api.report().getReportMe(context);
      this._data = reportSerializer;

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

  Future<void> removeReport(BuildContext context) async {
    try {
      await this.api.report().deleteReport(context);
      this._data = null;
      print("REMOVE REPORT COMPLETE");
      notifyListeners();
    } catch (e, backtrace) {
      print("GOT API EXCEPTION " + e.toString());
      print("BACKTRACE " + backtrace.toString());
    }
  }

  void setFile(XFile file) {
    this._file = file;
    notifyListeners();
  }
}
