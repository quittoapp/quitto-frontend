import 'package:dio/dio.dart';
import 'package:quitto/utils/persistence.utils.dart';

class AuthenticatedApi {
  static final instance = AuthenticatedApi();
  final _client = Dio();
  String? _jwt;

  AuthenticatedApi() {
    _client.options.baseUrl = 'http://10.0.2.2:3000/';

    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        _jwt ??= await PersistenceUtils.getJwt();

        options.headers['Authorization'] = 'Bearer $_jwt';
        handler.next(options);
      },
    ));
  }

  Dio get client => _client;
}
