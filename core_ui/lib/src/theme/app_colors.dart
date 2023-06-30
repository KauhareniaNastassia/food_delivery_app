import 'package:flutter/material.dart';

class AppColors {
  ///general colors
  static const Color primaryColor = Color(0xFF5BB533);
  static const Color primaryLightColor = Color(0xFFD9F579);
  static const Color primaryDarkColor = Color(0xFF305136);

  static const Color secondaryColor = Color(0xFFF4AB46);
  static const Color secondaryDarkColor = Color(0xFFE7911A);

  ///text colors
  static const Color titleTextColor = Color(0xFF282828);
  static const Color descriptionTextColor = Color(0xFF3B3B3B);
  static const Color primaryButtonTextColor = Color(0xFFF4F4F4);

  ///background colors
  static const Color backgroundColor = Color(0xFFF3EFEF);
  static const Color backgroundItemColor = Color(0xFFDBE0CD);
  static const Color backgroundDarkColor = Color(0xFFB9C57B);


  ///gradient
  static List<Color> primaryGradient = [
    primaryLightColor,
    primaryColor,
  ];
}
