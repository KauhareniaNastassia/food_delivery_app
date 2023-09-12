import 'package:flutter/material.dart';

class MenuItemTextField extends StatelessWidget {
  final String label;
  final double width;
  final TextEditingController? textEditingController;
  final String? Function(String?) validation;
  final int? maxLines;
  final TextInputType? keyboardType;

  const MenuItemTextField({
    super.key,
    required this.label,
    required this.validation,
    required this.width,
    this.textEditingController,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

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
          contentPadding:
              EdgeInsets.only(bottom: mediaQueryData.size.height * 0.001),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor),
          ),
        ),
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
