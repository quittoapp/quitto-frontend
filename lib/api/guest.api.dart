import 'package:dio/dio.dart';

class GuestApi {
  static final instance = GuestApi();
  final _client = Dio();

  GuestApi() {
    _client.options.baseUrl = 'http://10.0.2.2:3000/';
  }

  Dio get client => _client;
}
