import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quitto/services/user.service.dart';
import 'package:quitto/utils/time-of-day.utils.dart';

class FinishRegistrationStore extends ChangeNotifier {
  TimeOfDay? _timeWindowStartTime;
  TimeOfDay? _timeWindowEndTime;
  int? _cigarettesPerDay;
  List<String> _errors = [];

  List<String> get errors => _errors;

  void setSmokingStartTime(TimeOfDay smokingStartTime) {
    _timeWindowStartTime = smokingStartTime;
    notifyListeners();
  }

  void setSmokingEndTime(TimeOfDay smokingEndTime) {
    _timeWindowEndTime = smokingEndTime;
    notifyListeners();
  }

  void setSmokingsPerDay(int smokingsPerDay) {
    _cigarettesPerDay = smokingsPerDay;
  }

  void validate() {
    _errors = [];

    if (_timeWindowStartTime == null) {
      errors.add('Smoking start time must be specified');
      notifyListeners();
      return;
    }

    if (_timeWindowEndTime == null) {
      errors.add('Smoking end time must be specified');
      notifyListeners();
      return;
    }

    if (_cigarettesPerDay == null) {
      errors.add('Amount of smoking sessions per day should be specified');
      notifyListeners();
      return;
    }

    // pizdets
    if (_timeWindowEndTime == null || _timeWindowStartTime == null) {
      if (_timeWindowEndTime!.hour < _timeWindowStartTime!.hour ||
          (_timeWindowEndTime!.hour == _timeWindowStartTime!.hour &&
              _timeWindowEndTime!.minute < _timeWindowStartTime!.minute)) {
        errors.add('Smoking period start should be less than end');
        notifyListeners();
        return;
      }
    }

    notifyListeners();
  }

  Future<void> finishRegistration() async {
    validate();

    final finishRegistrationDTO = FinishRegistrationDTO(
      cigarettesPerDay: _cigarettesPerDay!,
      timeWindowStartTime: TimeOfDayUtils.timeOfDayToString(
        _timeWindowStartTime!,
      ),
      timeWindowEndTime: TimeOfDayUtils.timeOfDayToString(
        _timeWindowEndTime!,
      ),
    );

    await UserService.instance.finishRegistration(finishRegistrationDTO);
  }
}
