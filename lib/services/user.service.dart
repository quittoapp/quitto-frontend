import 'package:quitto/api/authenticated.api.dart';
import 'package:quitto/models/user.dart';
import 'package:quitto/services/notification.service.dart';

class FinishRegistrationDTO {
  final int cigarettesPerDay;
  final String timeWindowStartTime;
  final String timeWindowEndTime;

  FinishRegistrationDTO({
    required this.cigarettesPerDay,
    required this.timeWindowStartTime,
    required this.timeWindowEndTime,
  });
}

class UserService {
  static final instance = UserService();
  final _api = AuthenticatedApi.instance;

  Future<User> getMe() async {
    return _api.client.get('user/me').then((res) => User.fromJson(res.data));
  }

  Future<void> finishRegistration(
      FinishRegistrationDTO finishRegistrationDTO) async {
    final fcmToken = await NotificationService.instance.getFCMToken();
    final timezoneOffset = DateTime.now().timeZoneOffset.inHours;

    await _api.client.patch('user/signup/finish', data: {
      'fcmToken': fcmToken,
      'timezoneOffset': timezoneOffset,
      'cigarettesPerDay': finishRegistrationDTO.cigarettesPerDay,
      'timeWindowStartTime': finishRegistrationDTO.timeWindowStartTime,
      'timeWindowEndTime': finishRegistrationDTO.timeWindowEndTime,
    });
  }
}
