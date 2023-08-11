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
    final AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          isSignInPage
              ? appLocalization.translate('doNotHaveAnAccount')
              : appLocalization.translate('haveAnAccount'),
          style: theme.textTheme.titleSmall,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            isSignInPage
                ? appLocalization.translate('signUp')
                : appLocalization.translate('signIn'),
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
