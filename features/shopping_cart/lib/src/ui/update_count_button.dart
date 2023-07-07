import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UpdateCountButton extends StatelessWidget {
  const UpdateCountButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  final VoidCallback onTap;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 16,
        ),
      ),
    );
  }
}