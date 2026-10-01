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
import 'package:websparktest/features/shortest_path/data/repositories/shortest_path_repository_impl.dart'
    as _i264;
import 'package:websparktest/features/shortest_path/domain/repositories/shortest_path_repository.dart'
    as _i533;
import 'package:websparktest/features/shortest_path/domain/services/bfs_path_finder.dart'
    as _i830;
import 'package:websparktest/features/shortest_path/domain/services/path_finder.dart'
    as _i516;
import 'package:websparktest/features/shortest_path/domain/usecases/calculate_paths.dart'
    as _i962;
import 'package:websparktest/features/shortest_path/presentation/cubit/home_cubit.dart'
    as _i913;
import 'package:websparktest/features/shortest_path/presentation/cubit/process_cubit.dart'
    as _i1000;

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
    gh.factory<_i913.HomeCubit>(() => _i913.HomeCubit());
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
    gh.lazySingleton<_i533.ShortestPathRepository>(
      () => _i264.ShortestPathRepositoryImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i516.PathFinder>(() => const _i830.BfsPathFinder());
    gh.factory<_i962.CalculatePaths>(
      () => _i962.CalculatePaths(gh<_i516.PathFinder>()),
    );
    gh.factoryParam<_i1000.ProcessCubit, String, dynamic>(
      (_baseUrl, _) => _i1000.ProcessCubit(
        gh<_i533.ShortestPathRepository>(),
        gh<_i962.CalculatePaths>(),
        _baseUrl,
      ),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i922.ThirdPartyModule {}

class _$ApiModule extends _i231.ApiModule {}
