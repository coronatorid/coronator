import 'dart:io';

import 'package:coronator/src/core/api/api_builder.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/serializer/report_serializer.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ReportAPI {
  final APIBuilder _apiBuilder;

  ReportAPI(this._apiBuilder);

  Future<ReportSerializer> getReportMe(
    BuildContext context,
  ) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    ReportSerializer reportSerializer = await this._apiBuilder.get(
          context,
          '/reports',
          responseMapper: ReportSerializer.fromJson,
          token: authProvider.getLogin().auth.token,
        );

    return reportSerializer;
  }

  Future<dynamic> createReport(BuildContext context, File file) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    return this._apiBuilder.multipart(
          context,
          "/reports",
          file,
          token: authProvider.getLogin().auth.token,
        );
  }

  Future<void> deleteReport(BuildContext context) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    await this._apiBuilder.delete(
          context,
          '/reports',
          token: authProvider.getLogin().auth.token,
        );
  }
}
