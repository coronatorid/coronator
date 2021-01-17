import 'package:coronator/src/screen/timeline_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:workmanager/workmanager.dart';

class TimelineController {
  Widget build(BuildContext context) {
    Workmanager.registerPeriodicTask(
      "locationUpdateJob",
      "locationUpdate",
      frequency: Duration(minutes: 15),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    return TimelineScreen();
  }
}
