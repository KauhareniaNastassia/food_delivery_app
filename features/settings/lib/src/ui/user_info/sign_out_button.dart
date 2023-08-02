import 'package:flutter/material.dart';

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

    return IconButton(
      onPressed: onPressed,
      icon: Column(
        children: <Widget>[
          Icon(
            Icons.logout,
            color: theme.canvasColor,
            size: mediaQueryData.size.width * 0.08,
          ),
          Text(
            'Sign Out',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
