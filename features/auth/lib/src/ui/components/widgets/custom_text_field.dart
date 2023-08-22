import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final String? Function(String?) validation;
  final bool obscureText;
  final VoidCallback? onPressed;
  final bool? obscurePassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.validation,
    required this.obscureText,
    this.onPressed,
    this.obscurePassword,
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
          cursorColor: theme.disabledColor,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: theme.unselectedWidgetColor,
            ),
            contentPadding: const EdgeInsets.only(bottom: 2),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            suffixIcon: onPressed != null
                ? IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(
                      obscureText
                          ?'assets/image/open_eye_icon.svg'
                          : 'assets/image/close_eye_icon.svg',
                      color: AppColors.unselectedItemColor,
                      alignment: Alignment.bottomRight,
                      height: mediaQueryData.size.height * 0.025,
                    ),
                  )
                : null,
          ),
          obscureText: obscureText,
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
