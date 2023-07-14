import 'package:flutter/material.dart';

class BackToPreviousPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackToPreviousPageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_rounded,
      ),
    );
  }
}
