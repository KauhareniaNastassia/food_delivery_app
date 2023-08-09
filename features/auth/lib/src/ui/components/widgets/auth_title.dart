import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Center(
      child: Image.asset(
        'assets/image/logo.png',
        width: mediaQueryData.size.width * 0.4,
      ),
    );
  }
}
