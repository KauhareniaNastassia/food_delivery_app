import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: mediaQueryData.size.height * 0.3,
      child: const RiveAnimation.asset(
        'assets/image/rive_icons/logo.riv',
      ),
    );
  }
}
