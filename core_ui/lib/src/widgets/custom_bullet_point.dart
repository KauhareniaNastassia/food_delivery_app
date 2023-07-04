import 'package:flutter/material.dart';

class CustomDotPoint extends StatelessWidget {
  const CustomDotPoint({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.01,
      width: size.width * 0.01,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
