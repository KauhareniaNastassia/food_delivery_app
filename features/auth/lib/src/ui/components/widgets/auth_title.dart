import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: mediaQueryData.size.height * 0.3,
      child: RiveAnimation.asset(AnimationPathConstants.logoPath),
    );
  }
}
