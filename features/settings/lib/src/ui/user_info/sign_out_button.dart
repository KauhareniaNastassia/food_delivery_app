import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SignOutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignOutButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();

    return SizedBox(
      width: mediaQueryData.size.width * 0.22,
      child: IconButton(
        onPressed: onPressed,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.logout,
              color: theme.canvasColor,
              size: mediaQueryData.size.height *
                  0.04 *
                  settingsBloc.state.fontSize,
            ),
            Text(
             'signOut'.tr(),
              style: theme.textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
