import 'package:flutter/material.dart';

class AppStyles {
  static final defaultBorderRadius = BorderRadius.circular(15);
  static final mediumBorderRadius = BorderRadius.circular(50);
  static final largeBorderRadius = BorderRadius.circular(80);

  static final boxShadow = BoxShadow(
    color: const Color(0xFFC0C2BF).withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 50,
    offset: const Offset(
      0,
      3,
    ),
  );

  static final boxShadowForBottomBar = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 50,
    offset: const Offset(
      0,
      15,
    ),
  );
}
