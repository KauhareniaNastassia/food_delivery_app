import 'package:flutter/material.dart';

class AppTextStyles {
  static const String _merriweatherFamily = 'Merriweather';
  late final double fontSize;

  AppTextStyles({
    required this.fontSize,
  });

  static TextStyle size14WeightBoldText({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 14 * fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size16WeightMediumText({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 16 * fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle size16WeightSemiBoldText({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 16 * fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size18WeightSemiBoldText({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 18 * fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size20WeightSemiBoldText({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 20 * fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size22WeightSemiBoldText({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 22 * fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size24WeightBoldText({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 24 * fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
