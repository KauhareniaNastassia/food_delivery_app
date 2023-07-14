import 'package:flutter/material.dart';

class AppTextStyles {
  static const String _merriweatherFamily = 'Merriweather';

  static TextStyle size14WeightBoldText(Color color) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size16WeightMediumText(Color color) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle size16WeightSemiBoldText(Color color) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size18WeightSemiBoldText(Color color) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size20WeightSemiBoldText(Color color) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size22WeightSemiBoldText(Color color) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle size24WeightBoldText(Color color) {
    return TextStyle(
      fontFamily: _merriweatherFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
