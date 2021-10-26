import 'package:flutter/material.dart';

class TimeOfDayUtils {
  static String timeOfDayToString(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }
}
