import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UpdateCountButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const UpdateCountButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryColor,
        ),
        child: Icon(
          icon,
          color: AppColors.titleLightTextColor,
          size: 16,
        ),
      ),
    );
  }
}
