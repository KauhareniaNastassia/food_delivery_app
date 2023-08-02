import 'package:flutter/material.dart';

class ChangeSignPageSwitch extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSignInPage;

  const ChangeSignPageSwitch({
    super.key,
    required this.isSignInPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          isSignInPage ? 'Don\'t have an account?' : 'Already have an account?',
          style: theme.textTheme.titleSmall,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            isSignInPage ? 'Sign Up' : 'Sign In',
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
