import 'package:flutter/material.dart';
import 'package:websparktest/core/theme/app_theme.dart';

class Application extends StatelessWidget {
  const Application(this.routerConfig, {super.key});

  final RouterConfig<Object> routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, theme: AppTheme.light, routerConfig: routerConfig);
  }
}
