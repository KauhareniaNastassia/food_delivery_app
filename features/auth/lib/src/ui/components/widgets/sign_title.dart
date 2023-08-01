import 'package:flutter/material.dart';

class SignTitle extends StatelessWidget {
  const SignTitle({super.key});

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
