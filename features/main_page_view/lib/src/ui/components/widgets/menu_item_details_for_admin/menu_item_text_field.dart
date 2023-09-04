import 'package:flutter/material.dart';

class MenuItemTextField extends StatelessWidget {
  final String label;
  final TextEditingController? textEditingController;
  final String? Function(String?) validation;
  final double width;
  final int? maxLines;
  final TextInputType? keyboardType;

  const MenuItemTextField({
    super.key,
    required this.label,
    this.textEditingController,
    required this.validation,
    required this.width,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: width,
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        controller: textEditingController,
        validator: validation,
        cursorColor: theme.disabledColor,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: theme.unselectedWidgetColor,
          ),
          contentPadding: const EdgeInsets.only(bottom: 2),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColor,
            ),
          ),
        ),
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
