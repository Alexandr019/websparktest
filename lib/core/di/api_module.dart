// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:websparktest/core/network/interceptor/error_interceptor.dart';
import 'package:websparktest/core/network/interceptor/logger_interceptor.dart';
import 'package:websparktest/core/network/network_manager.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio(LoggerInterceptor loggerInterceptor, ErrorInterceptor errorInterceptor) {
    return NetworkManager.getApiDioClient(interceptors: [loggerInterceptor, errorInterceptor]);
  }
}
