import 'package:flutter/material.dart';

class AppColors {
  ///general colors
  static const Color primaryColor = Color(0xFF0D6F41);
  static const Color primaryLightColor = Color(0xFF13B067);
  static const Color primaryDarkColor = Color(0xFF393D38);

  static const Color secondaryColor = Color(0xFFF5A12E);
  static const Color secondaryDarkColor = Color(0xFFF69818);
  static const Color unselectedItemColor = Color(0xFF9D9D9E);

  ///text colors
  static const Color titleTextColor = Color(0xFF282828);
  static const Color titleLightTextColor = Color(0xFFE2E2E3);
  static const Color titleGreyTextColor = Color(0xFFC5C5C9);
  static const Color titleDarkGreyTextColor = Color(0xFF86868A);
  static const Color descriptionTextColor = Color(0xFF3B3B3B);
  static const Color primaryButtonTextColor = Color(0xFFF4F4F4);

  ///background colors
  static const Color backgroundColor = Color(0xFFF3EFEF);
  static const Color backgroundBottomNavigationBarColor = Color(0xFFFCFCFC);
  static const Color backgroundItemColor = Color(0xFFDBE0CD);
  static const Color backgroundItemDarkColor = Color(0xFF707C6A);
  static const Color backgroundDarkColor = Color(0xFF545D4F);

  ///gradient
  static List<Color> primaryGradient = [
    primaryLightColor,
    primaryColor,
  ];
}
