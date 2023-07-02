import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.secondaryColor,
    cardColor: AppColors.backgroundItemColor,

    /// app bar styles
    appBarTheme:  AppBarTheme(
      titleSpacing: 30,
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: AppTextStyles.size24WeightBoldText(AppColors.primaryButtonTextColor),
    ),

    /// navigation bar styles
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundBottomNavigationBarColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.unselectedItemColor,
    ),
  );

  ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.secondaryColor,
    cardColor: AppColors.backgroundItemDarkColor,

    /// app bar styles
    appBarTheme:  AppBarTheme(
      titleSpacing: 30,
      backgroundColor: AppColors.primaryDarkColor,
      titleTextStyle: AppTextStyles.size24WeightBoldText(AppColors.primaryButtonTextColor),
    ),

    /// navigation bar styles
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.primaryButtonTextColor,
    ),
  );
}
