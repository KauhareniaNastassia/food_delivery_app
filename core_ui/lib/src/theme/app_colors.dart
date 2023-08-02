import 'package:flutter/material.dart';

class AppColors {
  ///general colors
  static const Color primaryColor = Color(0xFF0D6F41);
  static const Color alternativePrimaryColor = Color(0xFF6A5C7A);
  static const Color primaryLightColor = Color(0xFF13B067);
  static const Color alternativePrimaryLightColor = Color(0xFF5C3D80);
  static const Color primaryDarkColor = Color(0xFF393D38);
  static const Color alternativePrimaryDarkColor = Color(0xFF352742);
  static const Color errorColor = Color(0xFFE35656);

  static const Color secondaryColor = Color(0xFFF5A12E);
  static const Color alternativeSecondaryColor = Color(0xFFBE6C82);
  static const Color secondaryDarkColor = Color(0xFFF69818);
  static const Color alternativeSecondaryDarkColor = Color(0xFFFDADC3);
  static const Color unselectedItemColor = Color(0xFF9D9D9E);

  ///text colors
  static const Color titleTextColor = Color(0xFF282828);
  static const Color titleLightTextColor = Color(0xFFE2E2E3);
  static const Color titleGreyTextColor = Color(0xFFC5C5C9);
  static const Color titleDarkGreyTextColor = Color(0xFF86868A);
  static const Color descriptionTextColor = Color(0xFF3B3B3B);
  static const Color primaryButtonTextColor = Color(0xFFF4F4F4);

  ///background colors
  static const Color backgroundColor = Color(0xFFFDFBFB);
  static const Color backgroundBottomNavigationBarColor = Color(0xFFFCFCFC);
  static const Color backgroundItemColor = Color(0xFFDBE0CD);
  static const Color alternativeBackgroundItemColor = Color(0xFAE5DFE0);
  static const Color backgroundItemDarkColor = Color(0xFF707C6A);
  static const Color alternativeBackgroundItemDarkColor = Color(0xFF806D78);
  static const Color backgroundDarkColor = Color(0xFF545D4F);
  static const Color alternativeBackgroundDarkColor = Color(0xFF5D4E58);

  ///gradient
  static List<Color> primaryGradient = [
    primaryLightColor,
    primaryColor,
  ];
}
