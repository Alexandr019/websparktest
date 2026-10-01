import 'package:equatable/equatable.dart';
import 'package:websparktest/core/utils/url_validator.dart';

sealed class HomeState extends Equatable {
  const HomeState(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}

final class HomeInitial extends HomeState {
  const HomeInitial([super.url = '']);
}

final class SuccessHomeState extends HomeState {
  const SuccessHomeState(super.url, this.requestId);

  final int requestId;

  @override
  List<Object?> get props => [url, requestId];
}

final class FailureHomeState extends HomeState {
  const FailureHomeState(super.url, this.error);

  final UrlError error;

  @override
  List<Object?> get props => [url, error];
}
