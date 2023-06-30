import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.secondaryColor,

    /// app bar styles
    appBarTheme:  AppBarTheme(
      titleSpacing: 30,
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: AppTextStyles.size24WeightBoldText(AppColors.primaryButtonTextColor),
    ),

    /// navigation bar styles
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      indicatorColor: AppColors.primaryColor.withOpacity(0.1),
      surfaceTintColor: Colors.transparent,
    ),
  );

  ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    useMaterial3: true,
    primaryColor: AppColors.primaryDarkColor,
    canvasColor: AppColors.secondaryDarkColor,

    /// app bar styles
    appBarTheme:  AppBarTheme(
      titleSpacing: 30,
      backgroundColor: AppColors.primaryDarkColor,
      titleTextStyle: AppTextStyles.size24WeightBoldText(AppColors.primaryButtonTextColor),
    ),

    /// navigation bar styles
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      indicatorColor: AppColors.primaryColor.withOpacity(0.1),
      surfaceTintColor: Colors.transparent,
    ),
  );
}
