import 'package:coronator/src/screen/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:teledart/telegram.dart';

class ReportController {
  final Telegram telegram;

  ReportController(this.telegram);

  Widget build(BuildContext context) {
    return ReportScreen();
  }
}
