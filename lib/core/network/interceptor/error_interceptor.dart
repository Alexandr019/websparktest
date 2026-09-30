import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:websparktest/core/error/api_exceptions.dart';

@injectable
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final customException = BaseApiException.parse(err);

    handler.next(customException);
  }
}
