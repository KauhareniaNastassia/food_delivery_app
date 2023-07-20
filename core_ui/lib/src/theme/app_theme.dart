import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final bool isStandardColorScheme;

  AppTheme({required this.isStandardColorScheme});

  ThemeData get lightThemeData {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      useMaterial3: true,
      primaryColor: isStandardColorScheme
          ? AppColors.primaryColor
          : AppColors.alternativePrimaryColor,
      canvasColor: isStandardColorScheme
          ? AppColors.secondaryColor
          : AppColors.alternativeSecondaryColor,
      cardColor: isStandardColorScheme
          ? AppColors.backgroundItemColor
          : AppColors.alternativeBackgroundItemColor,
      disabledColor: AppColors.unselectedItemColor,

      /// text styles
      textTheme: TextTheme(
        titleLarge: AppTextStyles.size20WeightSemiBoldText(
          AppColors.titleTextColor,
        ),
        titleMedium: AppTextStyles.size18WeightSemiBoldText(
          isStandardColorScheme
              ? AppColors.secondaryColor
              : AppColors.alternativeSecondaryColor,
        ),
        titleSmall: AppTextStyles.size16WeightMediumText(
          AppColors.titleDarkGreyTextColor,
        ),
        bodyMedium: AppTextStyles.size16WeightSemiBoldText(
          isStandardColorScheme
              ? AppColors.secondaryColor
              : AppColors.alternativeSecondaryColor,
        ),
        bodyLarge: AppTextStyles.size18WeightSemiBoldText(
          AppColors.titleTextColor,
        ),
      ),

      /// app bar styles
      appBarTheme: AppBarTheme(
        titleSpacing: 30,
        backgroundColor: isStandardColorScheme
            ? AppColors.primaryColor
            : AppColors.alternativePrimaryColor,
        titleTextStyle: AppTextStyles.size24WeightBoldText(
          AppColors.primaryButtonTextColor,
        ),
      ),

      /// navigation bar styles
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundBottomNavigationBarColor,
        selectedItemColor: isStandardColorScheme
            ? AppColors.primaryColor
            : AppColors.alternativePrimaryColor,
        unselectedItemColor: AppColors.unselectedItemColor,
      ),
    );
  }

  ThemeData get darkThemeData {
    return ThemeData(
      scaffoldBackgroundColor: isStandardColorScheme
          ? AppColors.backgroundDarkColor
          : AppColors.alternativeBackgroundDarkColor,
      useMaterial3: true,
      primaryColor: isStandardColorScheme
          ? AppColors.primaryLightColor
          : AppColors.alternativePrimaryLightColor,
      canvasColor: isStandardColorScheme
          ? AppColors.secondaryColor
          : AppColors.alternativeSecondaryDarkColor,
      cardColor: isStandardColorScheme
          ? AppColors.backgroundItemDarkColor
          : AppColors.alternativeBackgroundItemDarkColor,
      disabledColor: AppColors.titleDarkGreyTextColor,

      /// text styles
      textTheme: TextTheme(
        titleLarge: AppTextStyles.size20WeightSemiBoldText(
          AppColors.titleLightTextColor,
        ),
        titleMedium: AppTextStyles.size18WeightSemiBoldText(
          isStandardColorScheme
              ? AppColors.secondaryColor
              : AppColors.alternativeSecondaryDarkColor,
        ),
        titleSmall: AppTextStyles.size16WeightMediumText(
          AppColors.titleGreyTextColor,
        ),
        bodyMedium: AppTextStyles.size16WeightSemiBoldText(
          isStandardColorScheme
              ? AppColors.secondaryColor
              : AppColors.alternativeSecondaryDarkColor,
        ),
        bodyLarge: AppTextStyles.size18WeightSemiBoldText(
          AppColors.titleLightTextColor,
        ),
      ),

      /// app bar styles
      appBarTheme: AppBarTheme(
        titleSpacing: 30,
        backgroundColor: isStandardColorScheme
            ? AppColors.primaryDarkColor
            : AppColors.alternativePrimaryDarkColor,
        titleTextStyle: AppTextStyles.size24WeightBoldText(
          AppColors.primaryButtonTextColor,
        ),
      ),

      /// navigation bar styles
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isStandardColorScheme
            ? AppColors.primaryDarkColor
            : AppColors.alternativePrimaryDarkColor,
        selectedItemColor: isStandardColorScheme
            ? AppColors.primaryLightColor
            : AppColors.alternativeSecondaryDarkColor,
        unselectedItemColor: AppColors.primaryButtonTextColor,
      ),
    );
  }
}
