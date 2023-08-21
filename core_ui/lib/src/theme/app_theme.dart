import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final bool isStandardColorScheme;
  final double fontSize;

  AppTheme({
    required this.isStandardColorScheme,
    required this.fontSize,
  });

  ThemeData get lightThemeData {
    final primaryColor = isStandardColorScheme
        ? AppColors.primaryColor
        : AppColors.alternativePrimaryColor;
    final secondaryColor = isStandardColorScheme
        ? AppColors.secondaryColor
        : AppColors.alternativeSecondaryColor;
    final backgroundItemColor = isStandardColorScheme
        ? AppColors.backgroundItemColor
        : AppColors.alternativeBackgroundItemColor;
    final titleTextColor = isStandardColorScheme
        ? AppColors.titleDarkGreyTextColor
        : AppColors.titleGreyTextColor;

    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      useMaterial3: true,
      primaryColor: primaryColor,
      canvasColor: secondaryColor,
      cardColor: backgroundItemColor,
      disabledColor: AppColors.unselectedItemColor,

      /// text styles
      textTheme: TextTheme(
        titleLarge: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: AppColors.titleTextColor,
        ),
        titleMedium: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: secondaryColor,
        ),
        titleSmall: AppTextStyles.size16WeightMediumText(
          fontSize: fontSize,
          color: titleTextColor,
        ),
        bodyMedium: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: secondaryColor,
        ),
        bodyLarge: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: AppColors.primaryColor,
        ),
        bodySmall: AppTextStyles.size16WeightMediumText(
          fontSize: fontSize,
          color: AppColors.titleTextColor,
        ),
        displaySmall: AppTextStyles.size14WeightBoldText(
          fontSize: fontSize,
          color: secondaryColor,
        ),
        displayMedium: AppTextStyles.size14WeightBoldText(
          fontSize: fontSize,
          color: AppColors.titleTextColor,
        ),
      ),

      /// app bar styles
      appBarTheme: AppBarTheme(
        titleSpacing: 30,
        backgroundColor: primaryColor,
        titleTextStyle: AppTextStyles.size22WeightBoldText(
          fontSize: fontSize,
          color: AppColors.primaryButtonTextColor,
        ),
      ),

      /// navigation bar styles
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundBottomNavigationBarColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: AppColors.unselectedItemColor,
      ),
    );
  }

  ThemeData get darkThemeData {
    final primaryColor = isStandardColorScheme
        ? AppColors.primaryLightColor
        : AppColors.alternativePrimaryLightColor;
    final secondaryColor = isStandardColorScheme
        ? AppColors.secondaryColor
        : AppColors.alternativeSecondaryDarkColor;
    final backgroundItemColor = isStandardColorScheme
        ? AppColors.backgroundItemDarkColor
        : AppColors.alternativeBackgroundItemDarkColor;
    final scaffoldBackgroundColor = isStandardColorScheme
        ? AppColors.backgroundDarkColor
        : AppColors.alternativeBackgroundDarkColor;
    final backgroundColor = isStandardColorScheme
        ? AppColors.primaryDarkColor
        : AppColors.alternativePrimaryDarkColor;
    final titleTextColor = isStandardColorScheme
        ? AppColors.titleDarkGreyTextColor
        : AppColors.titleGreyTextColor;

    return ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      useMaterial3: true,
      primaryColor: primaryColor,
      canvasColor: secondaryColor,
      cardColor: backgroundItemColor,
      disabledColor: AppColors.titleDarkGreyTextColor,

      /// text styles
      textTheme: TextTheme(
        titleLarge: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: AppColors.titleLightTextColor,
        ),
        titleMedium: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: secondaryColor,
        ),
        titleSmall: AppTextStyles.size16WeightMediumText(
          fontSize: fontSize,
          color: titleTextColor,
        ),
        bodyMedium: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: secondaryColor,
        ),
        bodyLarge: AppTextStyles.size16WeightSemiBoldText(
          fontSize: fontSize,
          color: AppColors.titleLightTextColor,
        ),
        bodySmall: AppTextStyles.size16WeightMediumText(
          fontSize: fontSize,
          color: AppColors.titleTextColor,
        ),
        displaySmall: AppTextStyles.size14WeightBoldText(
          fontSize: fontSize,
          color: secondaryColor,
        ),
        displayMedium: AppTextStyles.size14WeightBoldText(
          fontSize: fontSize,
          color: AppColors.titleTextColor,
        ),
      ),

      /// app bar styles
      appBarTheme: AppBarTheme(
        titleSpacing: 30,
        backgroundColor: backgroundColor,
        titleTextStyle: AppTextStyles.size22WeightBoldText(
          fontSize: fontSize,
          color: AppColors.primaryButtonTextColor,
        ),
      ),

      /// navigation bar styles
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: AppColors.primaryButtonTextColor,
      ),
    );
  }
}
