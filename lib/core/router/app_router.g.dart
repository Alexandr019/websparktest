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
  static ProcessRoute _fromState(GoRouterState state) =>
      ProcessRoute(baseUrl: state.uri.queryParameters['base-url']!);

  ProcessRoute get _self => this as ProcessRoute;

  @override
  String get location => GoRouteData.$location(
    '/process',
    queryParams: {'base-url': _self.baseUrl},
  );

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
      ResultListRoute(state.extra as List<PathResultEntity>);

  ResultListRoute get _self => this as ResultListRoute;

  @override
  String get location => GoRouteData.$location('/results');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $previewRoute => GoRouteData.$route(
  path: '/preview',
  hasOverriddenOnExit: false,
  factory: $PreviewRoute._fromState,
);

mixin $PreviewRoute on GoRouteData {
  static PreviewRoute _fromState(GoRouterState state) =>
      PreviewRoute(state.extra as PathResultEntity);

  PreviewRoute get _self => this as PreviewRoute;

  @override
  String get location => GoRouteData.$location('/preview');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}
