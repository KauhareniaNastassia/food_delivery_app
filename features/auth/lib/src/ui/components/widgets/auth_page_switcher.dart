import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AuthPageSwitcher extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSignInPage;

  const AuthPageSwitcher({
    super.key,
    required this.isSignInPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          isSignInPage ? 'doNotHaveAnAccount'.tr() : 'haveAnAccount'.tr(),
          style: theme.textTheme.displayLarge,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            isSignInPage ? 'signUp'.tr() : 'signIn'.tr(),
            style: theme.textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
