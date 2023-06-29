import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ImagePlaceholder extends StatelessWidget {
  final IconData iconData;
  final double iconSize;

  const ImagePlaceholder({
    Key? key,
    required this.iconData,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
