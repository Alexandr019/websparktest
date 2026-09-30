import 'package:flutter/material.dart';
import 'package:websparktest/core/constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary, foregroundColor: AppColors.onPrimary),
    filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48))),
    inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
  );
}
