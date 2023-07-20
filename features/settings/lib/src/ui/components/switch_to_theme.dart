import 'package:flutter/material.dart';

class SwitchToTheme extends StatelessWidget {
  final bool isLight;
  final VoidCallback onTap;

  const SwitchToTheme({
    super.key,
    required this.isLight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isLight ? 'Switch to dark theme' : 'Switch to light theme',
          style: theme.textTheme.titleLarge,
        ),
        InkWell(
          onTap: onTap,
          child: Icon(
            isLight ? Icons.brightness_4_rounded : Icons.brightness_2_outlined,
            color: theme.canvasColor,
            size: size.width * 0.09,
          ),
        )
      ],
    );
  }
}
