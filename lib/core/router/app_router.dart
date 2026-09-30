import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
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
  const ProcessRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ProcessScreen();
}

@TypedGoRoute<ResultListRoute>(path: '/results')
class ResultListRoute extends GoRouteData with $ResultListRoute {
  const ResultListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ResultListScreen();
}

@TypedGoRoute<PreviewRoute>(path: '/preview')
class PreviewRoute extends GoRouteData with $PreviewRoute {
  const PreviewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const PreviewScreen();
}
