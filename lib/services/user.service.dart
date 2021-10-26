import 'package:quitto/api/authenticated.api.dart';
import 'package:quitto/model/user.dart';

class UserService {
  static final instance = UserService();
  final _api = AuthenticatedApi.instance;

  Future<User> getMe() async {
    return _api.client.get('user/me').then((res) => User.fromJson(res.data));
  }
}
