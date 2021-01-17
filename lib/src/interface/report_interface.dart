import 'package:flutter/material.dart';

abstract class ReportInterface {
  Future<void> removeReport(BuildContext context);
  Future<void> setPicture(BuildContext context);
  Future<void> report(BuildContext context);
}
