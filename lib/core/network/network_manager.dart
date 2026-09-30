import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._();

  static Dio getApiDioClient({List<Interceptor> interceptors = const []}) {
    final options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {'Accept': 'application/json'},
    );

    final dio = Dio(options);
    dio.interceptors.addAll(interceptors);

    return dio;
  }
}
