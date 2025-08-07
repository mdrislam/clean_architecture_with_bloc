import 'package:flutter/material.dart';
import 'package:tikweb_task/core/values/app_sizes.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightAppBarBackground,
        foregroundColor: AppColors.lightAppBarForeground,
        titleSpacing: 0,
      ),
      iconTheme: const IconThemeData(color: AppColors.lightIconColor),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightInputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: AppColors.lightHintText),
        prefixIconColor: AppColors.lightPrefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: AppSizes.iconConstant,
          minHeight: AppSizes.iconConstant,
        ),
        isDense: true,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightCardColor,
        elevation: AppSizes.cardElevation,
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: AppSizes.cardMarginVertical,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkAppBarBackground,
        foregroundColor: AppColors.darkAppBarForeground,
        titleSpacing: 0,
      ),
      iconTheme: const IconThemeData(color: AppColors.darkIconColor),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: AppColors.darkHintText),
        prefixIconColor: AppColors.darkPrefixIcon,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkCardColor,
        elevation: AppSizes.cardElevation,
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: AppSizes.cardMarginVertical,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
      ),
    );
  }
}
