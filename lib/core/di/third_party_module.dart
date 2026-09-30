import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:websparktest/core/router/app_router.dart';

@module
abstract class ThirdPartyModule {
  @singleton
  GoRouter get router => GoRouter(routes: $appRoutes, initialLocation: '/home');

  @singleton
  Logger get logger => Logger();
}
