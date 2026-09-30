// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $homeRoute,
  $processRoute,
  $resultListRoute,
  $previewRoute,
];

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/home',
  hasOverriddenOnExit: false,
  factory: $HomeRoute._fromState,
);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $processRoute => GoRouteData.$route(
  path: '/process',
  hasOverriddenOnExit: false,
  factory: $ProcessRoute._fromState,
);

mixin $ProcessRoute on GoRouteData {
  static ProcessRoute _fromState(GoRouterState state) => const ProcessRoute();

  @override
  String get location => GoRouteData.$location('/process');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resultListRoute => GoRouteData.$route(
  path: '/results',
  hasOverriddenOnExit: false,
  factory: $ResultListRoute._fromState,
);

mixin $ResultListRoute on GoRouteData {
  static ResultListRoute _fromState(GoRouterState state) =>
      const ResultListRoute();

  @override
  String get location => GoRouteData.$location('/results');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $previewRoute => GoRouteData.$route(
  path: '/preview',
  hasOverriddenOnExit: false,
  factory: $PreviewRoute._fromState,
);

mixin $PreviewRoute on GoRouteData {
  static PreviewRoute _fromState(GoRouterState state) => const PreviewRoute();

  @override
  String get location => GoRouteData.$location('/preview');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
