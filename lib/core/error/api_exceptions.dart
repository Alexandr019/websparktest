import 'package:dio/dio.dart';

abstract class ApiException {
  const ApiException();

  String get userMessage;
}

class BaseApiException extends DioException implements ApiException {
  BaseApiException({required DioException dioError, this.details})
    : super(
        requestOptions: dioError.requestOptions,
        response: dioError.response,
        type: dioError.type,
        error: dioError.error,
      );

  final String? details;

  @override
  String get userMessage {
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 400:
        return 'Invalid request. Please check the URL or data.';
      case 404:
        return 'Endpoint not found. Check the API URL.';
      case 429:
        return 'Too many requests. Please wait and try again.';
      case 500:
        return 'Internal server error. Please try again later.';
      default:
        return details ?? 'An unexpected error occurred. Please try again.';
    }
  }

  factory BaseApiException.parse(DioException err) {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return NetworkException(dioError: err);
    }

    String? serverMessage;
    if (err.response?.data is Map<String, dynamic>) {
      final data = err.response!.data as Map<String, dynamic>;
      serverMessage = data['message'] as String?;
    }

    return BaseApiException(dioError: err, details: serverMessage);
  }
}

class NetworkException extends BaseApiException {
  NetworkException({required super.dioError}) : super(details: 'No internet connection or server is unreachable.');

  @override
  String get userMessage => details!;
}
