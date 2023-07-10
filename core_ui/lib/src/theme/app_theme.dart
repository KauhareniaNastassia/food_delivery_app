import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.secondaryColor,
    cardColor: AppColors.backgroundItemColor,
    disabledColor: AppColors.unselectedItemColor,

    /// text styles
    textTheme: TextTheme(
      titleLarge: AppTextStyles.size20WeightSemiBoldText(
        AppColors.titleTextColor,
      ),
      titleMedium: AppTextStyles.size18WeightSemiBoldText(
        AppColors.secondaryColor,
      ),
      titleSmall: AppTextStyles.size16WeightMediumText(
        AppColors.titleDarkGreyTextColor,
      ),
      bodyMedium: AppTextStyles.size16WeightSemiBoldText(
        AppColors.secondaryColor,
      ),
      bodyLarge: AppTextStyles.size18WeightSemiBoldText(
        AppColors.titleTextColor,
      ),
    ),

    /// app bar styles
    appBarTheme: AppBarTheme(
      titleSpacing: 30,
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: AppTextStyles.size24WeightBoldText(
        AppColors.primaryButtonTextColor,
      ),
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
    primaryColor: AppColors.primaryLightColor,
    canvasColor: AppColors.secondaryColor,
    cardColor: AppColors.backgroundItemDarkColor,
    disabledColor: AppColors.titleDarkGreyTextColor,

    /// text styles
    textTheme: TextTheme(
      titleLarge: AppTextStyles.size20WeightSemiBoldText(
        AppColors.titleLightTextColor,
      ),
      titleMedium: AppTextStyles.size18WeightSemiBoldText(
        AppColors.secondaryDarkColor,
      ),
      titleSmall: AppTextStyles.size16WeightMediumText(
        AppColors.titleGreyTextColor,
      ),
      bodyMedium: AppTextStyles.size16WeightSemiBoldText(
        AppColors.secondaryDarkColor,
      ),
      bodyLarge: AppTextStyles.size18WeightSemiBoldText(
        AppColors.titleLightTextColor,
      ),
    ),

    /// app bar styles
    appBarTheme: AppBarTheme(
      titleSpacing: 30,
      backgroundColor: AppColors.primaryDarkColor,
      titleTextStyle: AppTextStyles.size24WeightBoldText(
        AppColors.primaryButtonTextColor,
      ),
    ),

    /// navigation bar styles
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkColor,
      selectedItemColor: AppColors.primaryLightColor,
      unselectedItemColor: AppColors.primaryButtonTextColor,
    ),
  );
}
