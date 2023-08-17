import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RiveAsset extends StatelessWidget {
  final String riveAnimationPath;

  const RiveAsset({
    required this.riveAnimationPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      riveAnimationPath,
      fit: BoxFit.contain,
    );
  }
}
