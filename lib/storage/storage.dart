import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage instance = Storage();

  final _storage = new FlutterSecureStorage();

  Future<void> saveJwt(String jwt) async {
    await _storage.write(key: 'jwt', value: jwt);
  }

  Future<String?> getJwt() async {
    return await _storage.read(key: 'jwt');
  }
}
