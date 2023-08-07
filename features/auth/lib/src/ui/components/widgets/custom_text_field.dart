import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final String? Function(String?) validation;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.validation,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: mediaQueryData.size.height * 0.12,
        child: TextFormField(
          controller: textEditingController,
          validator: validation,
          decoration: InputDecoration(
            labelText: label,
          ),
          obscureText: obscureText,
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
