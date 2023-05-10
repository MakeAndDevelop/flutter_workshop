import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData defaultTheme(BuildContext context) {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        background: AppColors.background,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.secondary,
        space: 24,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.secondary,
            displayColor: AppColors.secondary,
          ),
    );
  }
}
