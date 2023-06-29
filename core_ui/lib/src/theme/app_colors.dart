import 'package:flutter/material.dart';

class AppColors {
  ///general colors
  static const Color primaryColor = Color(0xFF5BB533);
  static const Color primaryLightColor = Color(0xFFAFF39A);
  static const Color primaryDarkColor = Color(0xFF376E20);
  static const Color secondaryColor = Color(0xFFF4AB46);

  ///text colors
  static const Color titleTextColor = Color(0xFF282828);
  static const Color descriptionTextColor = Color(0xFF3B3B3B);
  static const Color primaryButtonTextColor = Color(0xFFF4F4F4);

  ///background colors
  static const Color backgroundColor = Color(0xFFF4F4F4);
  static const Color backgroundItemColor = Color(0xFFF0F1EC);

  ///gradient
  static List<Color> primaryGradient = [
    primaryLightColor,
    primaryColor,
  ];
}
