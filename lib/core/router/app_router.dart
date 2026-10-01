import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';
import 'package:websparktest/features/shortest_path/presentation/screen/home_screen.dart';
import 'package:websparktest/features/shortest_path/presentation/screen/preview_screen.dart';
import 'package:websparktest/features/shortest_path/presentation/screen/process_screen.dart';
import 'package:websparktest/features/shortest_path/presentation/screen/result_list_screen.dart';

part 'app_router.g.dart';

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<ProcessRoute>(path: '/process')
class ProcessRoute extends GoRouteData with $ProcessRoute {
  const ProcessRoute({required this.baseUrl});

  final String baseUrl;

  @override
  Widget build(BuildContext context, GoRouterState state) => ProcessScreen(baseUrl: baseUrl);
}

@TypedGoRoute<ResultListRoute>(path: '/results')
class ResultListRoute extends GoRouteData with $ResultListRoute {
  const ResultListRoute(this.$extra);

  final List<PathResultEntity> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => ResultListScreen(results: $extra);
}

@TypedGoRoute<PreviewRoute>(path: '/preview')
class PreviewRoute extends GoRouteData with $PreviewRoute {
  const PreviewRoute(this.$extra);

  final PathResultEntity $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => PreviewScreen(result: $extra);
}
