import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ImagePlaceholder extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final double? width;
  final double? height;

  const ImagePlaceholder({
    super.key,
    required this.iconData,
    required this.iconSize,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(
        iconData,
        color: AppColors.primaryButtonTextColor,
        size: iconSize,
      ),
    );
  }
}
