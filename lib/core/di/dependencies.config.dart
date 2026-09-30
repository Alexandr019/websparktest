// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:websparktest/core/di/api_module.dart' as _i231;
import 'package:websparktest/core/di/third_party_module.dart' as _i922;
import 'package:websparktest/core/network/interceptor/error_interceptor.dart'
    as _i356;
import 'package:websparktest/core/network/interceptor/logger_interceptor.dart'
    as _i307;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    final apiModule = _$ApiModule();
    gh.factory<_i356.ErrorInterceptor>(() => _i356.ErrorInterceptor());
    gh.singleton<_i583.GoRouter>(() => thirdPartyModule.router);
    gh.singleton<_i974.Logger>(() => thirdPartyModule.logger);
    gh.factory<_i307.LoggerInterceptor>(
      () => _i307.LoggerInterceptor(logger: gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => apiModule.dio(
        gh<_i307.LoggerInterceptor>(),
        gh<_i356.ErrorInterceptor>(),
      ),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i922.ThirdPartyModule {}

class _$ApiModule extends _i231.ApiModule {}
