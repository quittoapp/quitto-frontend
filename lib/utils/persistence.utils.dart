import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PersistenceUtils {
  static final _storage = new FlutterSecureStorage();

  static Future<void> saveJwt(String jwt) async {
    await _storage.write(key: 'jwt', value: jwt);
  }

  static Future<String?> getJwt() async {
    return await _storage.read(key: 'jwt');
  }
}
