import 'package:flutter/material.dart';

class UserNameBlock extends StatelessWidget {
  final String userName;
  final String email;

  const UserNameBlock({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          userName,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          email,
          style: theme.textTheme.titleSmall,
        ),
      ],
    );
  }
}
